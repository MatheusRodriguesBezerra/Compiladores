module CodeGen where

import IR
import AST
import SymbolTable
import           Data.Map (Map)
import qualified Data.Map as Map
import           Control.Monad.State (State)
import qualified Control.Monad.State as State
import Control.Monad.Trans.State.Lazy (State, runState)

type Supply = (Int,Int) 
type Table = [(String, Temp)]

createTemps :: [Env] -> Table
createTemps ((x,_):xs) = [(x,"t"++show (length xs))] ++ createTemps xs

newTemp :: State Supply Temp
newTemp 
  = do (temps,labels) <- State.get
       State.put (temps+1, labels)
       return ("t"++show temps)

newLabel :: State Supply Label 
newLabel
  = do (temps,labels) <- State.get
       State.put (temps, labels+1)
       return ("L"++show labels)

findTemp :: String -> Table -> Temp
findTemp name [] = error "invalid variable"
findTemp name ((x,y):xs)
    | x == name = y
    | otherwise = findTemp name xs

newTemps :: Int -> State Supply [Temp]
newTemps n 
    | n > 0 = do t <- newTemp
                 ts <- newTemps (n-1)
                 return (t:ts)
    | otherwise = return []
    

reuseTemps :: Int -> State Supply ()
reuseTemps n
  = do (temps, labels) <- State.get
       State.put (temps-n, labels)


transExpr :: Exp -> Table -> Temp -> State Supply [Instr]
transExpr (VarExp x) tabl dest = return [MOVE dest (findTemp x tabl)]
transExpr (Num n) table dest = return [MOVEI dest n]
transExpr (BinOp e1 op e2) table dest
    = do temp1 <- newTemp 
         temp2 <- newTemp 
         code1 <- transExpr e1 table temp1 
         code2 <- transExpr e2 table temp2
         reuseTemps 2
         return (code1 ++ code2 ++ [OP op dest temp1 temp2])
transExpr (FunCall id args) tabl dest
    = do (code, temps) <- transArgs args tabl
         return (code ++ [CALL dest id temps])
transExpr (TrueConst) _ dest = return [MOVEI dest 1] 
transExpr (FalseConst) _ dest = return [MOVEI dest 0]
transExpr (RelOp e1 op e2) table dest
    = do label1 <- newLabel
         label2 <- newLabel
         label3 <- newLabel
         code1 <- transCond (RelOp e1 op e2) table label1 label2
         return (code1 ++ [LABEL label1, MOVEI dest 0, JUMP label3] ++ [LABEL label2, MOVEI dest 1, JUMP label3])




transArgs :: [Exp] -> Table -> State Supply ([Instr], [Temp])
transArgs [] tabl = return ([], [])
transArgs (exp:exps) tabl
        = do temp <- newTemp 
             code <- transExpr exp tabl temp 
             (code', temps') <- transArgs exps tabl
             return (code++code', temp:temps')




transStm :: Stmt -> Table -> State Supply [Instr]
transStm (Assign var expr) tabl = transExpr expr tabl (findTemp var tabl)
transStm (Block stmts) tabl = transStmList stmts tabl
transStm (If cond stm) tabl 
    = do label1  <- newLabel 
         label2 <- newLabel 
         code1  <- transCond cond tabl label1 label2 
         code2  <- transStm stm tabl
         return (code1 ++ [LABEL label1] ++ code2 ++ [LABEL label2])
transStm (IfElse cond stm1 stm2) tabl
    = do label1 <- newLabel 
         label2 <- newLabel 
         label3 <- newLabel 
         code1 <- transCond cond tabl label1 label2 
         code2 <- transStm stm1 tabl 
         code3 <- transStm stm2 tabl 
         return (code1 ++ [LABEL label1] ++ code2 ++ [JUMP label3, LABEL label2] ++ code3 ++ [LABEL label3])
transStm  (While cond stm) tabl 
    = do label1 <- newLabel
         label2 <- newLabel
         label3 <- newLabel
         code1 <- transCond cond tabl label2 label3
         code2 <- transStm stm tabl 
         return ([LABEL label1] ++ code1 ++ [LABEL label2] ++ code2 ++ [JUMP label1, LABEL label3])
transStm  (For stt1 cond stt2 code) tabl 
    = do lcond <- newLabel
         lbody <- newLabel
         lend <- newLabel
         code1 <- transCond cond tabl lbody lend
         code2 <- transStm code tabl 
         start <- transStm stt1 tabl
         cycle <- transStm stt2 tabl
         return (start ++ [LABEL lcond] ++ code1 ++ [LABEL lbody] ++ code2 ++ cycle ++ [JUMP lcond, LABEL lend])
transStm (Return expr) tabl 
    = do dest <- newTemp
         code <- transExpr expr tabl  dest
         reuseTemps 1
         return (code ++ [RETURN dest])
transStm (ExpSimple expr) tabl
    = do dest <- newTemp
         code <- transExpr expr tabl dest
         return code
transStm (Incr (VarExp x)) tabl
    = do dest1 <- newTemp
         code1 <- transExpr (Num 1) tabl dest1
         return (code1 ++ [OP Add (findTemp x tabl) (findTemp x tabl) dest1])
transStm (Decr (VarExp x)) tabl
    = do dest1 <- newTemp
         code1 <- transExpr (Num 1) tabl dest1
         return (code1 ++ [OP Minus (findTemp x tabl) (findTemp x tabl) dest1])


        

transCond :: Exp -> Table -> Label -> Label -> State Supply [Instr]
transCond (RelOp e1 And e2) tabl ltrue lfalse
    = do label2 <- newLabel
         code1 <- transCond e1 tabl label2 lfalse
         code2 <- transCond e2 tabl ltrue lfalse 
         return ( code1 ++ [LABEL label2] ++ code2 )
transCond (RelOp e1 Or e2) tabl ltrue lfalse
    = do label2 <- newLabel
         code1 <- transCond e1 tabl ltrue label2
         code2 <- transCond e2 tabl ltrue lfalse 
         return ( code1 ++ [LABEL label2] ++ code2 )
transCond (RelOp e1 rel e2) tabl ltrue lfalse
    | rel == LowerThan || rel == LowerEqualsThan || rel == GreaterThan || rel == GreaterEqualsThan || rel == DiffThan || rel == EqualsThan =
        do temp1 <- newTemp
           temp2 <- newTemp 
           code1 <- transExpr e1 tabl temp1
           code2 <- transExpr e2 tabl temp2
           return ( code1 ++ code2 ++ [COND temp1 rel temp2 ltrue lfalse] )
transCond (TrueConst) tabl ltrue lfalse = return [JUMP ltrue]
transCond (FalseConst) tabl ltrue lfalse = return [JUMP lfalse]
transCond (Not e1) tabl ltrue lfalse = (transCond e1 tabl lfalse ltrue)
transCond (VarExp x) tabl ltrue lfalse
    = do t <- newTemp
         code1 <- transExpr (VarExp x) tabl t
         return ( code1 ++ [COND t DiffThan "zero" ltrue lfalse] )
transCond (FunCall x y) tabl ltrue lfalse
    = do t <- newTemp
         code1 <- transExpr (FunCall x y) tabl t
         return ( code1 ++ [COND t DiffThan "zero" ltrue lfalse] )



transStmList :: [Stmt] -> Table -> State Supply [Instr]
transStmList [] tabl = return []
transStmList (stm:rest) tabl 
    = do code1 <- transStm stm tabl 
         code2 <- transStmList rest tabl
         return (code1 ++ code2)




transFunDef :: Function -> State Supply [Instr]
transFunDef (Function ty name params decls body) 
    = do targs <- newTemps (length params) 
         tlocals <- newTemps (length decls) 
         let table = (myZip1 params targs) ++ (myZip2 decls tlocals)
         code <- transStmList body table
         return (LABELFUN name (length table) : code)




myZip1 :: [ParamDecl] -> [Temp] -> Table
myZip1 [] _ = []
myZip1 ((Param _ x):xs) (state:supply) = (x, state) : myZip1 xs supply

-- -- Corrigindo myZip2
myZip2 :: [Declare] -> [Temp] -> Table
myZip2 [] _ = []
myZip2 ((DeclareId _ name):xs) (state:supply) = (name, state) : myZip2 xs supply


transProgram :: Prog -> State Supply [Instr]
transProgram (Program []) = return []
transProgram (Program (x:xs)) = do
    code <- transFunDef x
    rest <- transProgram (Program xs)
    return (code ++ rest)