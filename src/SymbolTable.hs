module SymbolTable where
import Parser
import AST

type Env = (String, Tp)


--main
typeVerify :: Prog -> Bool
typeVerify x = callAnalisys (extractEnv x []) (programList x)

callAnalisys :: [[Env]] -> [[Stmt]] -> Bool
callAnalisys [] _ = True
callAnalisys (x:xs) (y:ys)
    | (checkBlocks x y) = callAnalisys xs ys
    | otherwise = False 


-- extrair argumentos, variáveis e funções
extractEnv :: Prog -> [Env] -> [[Env]]
extractEnv (Program []) _ = []
extractEnv (Program (x:xs)) [] = [(extractAll x) ++ (extractFuncs (Program (x:xs)))] ++ extractEnv (Program xs) (extractFuncs (Program (x:xs)))
extractEnv (Program (x:xs)) ys = [(extractAll x) ++ ys] ++ extractEnv (Program xs) ys
    
extractAll :: Function -> [Env]
extractAll (Function _ _ params decl _) = extractDecls decl ++ extractParams params

extractFuncs :: Prog -> [Env]
extractFuncs (Program []) = [("print_int", TyFun [TyInt] TyInt), ("scan_int", TyFun [] TyInt)]
extractFuncs (Program ((Function t name params _ _):xs)) = [(name, TyFun (getTypesOfParams params) t)] ++ extractFuncs (Program xs)

extractParams :: [ParamDecl] -> [Env]
extractParams [] = []
extractParams ((Param ty name):xs) = (name,ty) : extractParams xs

extractDecls :: [Declare] -> [Env]
extractDecls [] = []
extractDecls ((DeclareId ty name):xs) = (name,ty) : extractDecls xs

getTypesOfParams :: [ParamDecl] -> [Tp]
getTypesOfParams [] = []
getTypesOfParams ((Param t _):xs) = [t] ++ getTypesOfParams xs


-- extrair statments
programList :: Prog -> [[Stmt]]
programList (Program [x]) = [(extractStmts x)]
programList (Program (x:xs)) = [(extractStmts x)] ++ programList (Program xs)

extractStmts :: Function -> [Stmt]
extractStmts (Function _ _ _ _ l) = l


-- type analisys
findType :: [Env] -> String -> Tp
findType [] name = error ("undeclared var " ++ name)
findType ((x,y):xs) name
    | x == name = y
    | otherwise = findType xs name

checkExp :: [Env] -> Exp -> Tp
checkExp env (Num n) = TyInt
checkExp env (VarExp n) = findType env n
checkExp env (TrueConst) = TyBool
checkExp env (FalseConst) = TyBool
checkExp env (BinOp e1 Add e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyInt
  | otherwise = error "type error in + (sum)"
checkExp env (BinOp e1 Minus e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyInt
  | otherwise = error "type error in - (minus)"
checkExp env (BinOp e1 Mult e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyInt
  | otherwise = error "type error in * (mult)"
checkExp env (BinOp e1 Div e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyInt
  | otherwise = error "type error in / (div)"
checkExp env (BinOp e1 Mod e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyInt
  | otherwise = error "type error in % (module)"
checkExp env (RelOp e1 LowerThan e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyBool
  | otherwise = error "type error in < (lower than)"
checkExp env (RelOp e1 LowerEqualsThan e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyBool
  | otherwise = error "type error in <= (lower or equals than)"
checkExp env (RelOp e1 GreaterThan e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyBool
  | otherwise = error "type error in > (greater than)"
checkExp env (RelOp e1 EqualsThan e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyBool
  | otherwise = error "type error in == (equals than)"
checkExp env (RelOp e1 DiffThan e2)
  | (checkExp env e1) == TyInt && (checkExp env e2) == TyInt = TyBool
  | otherwise = error "type error in != (diff than)"
checkExp env (RelOp e1 And e2)
  | (checkExp env e1) == TyBool && (checkExp env e2) == TyBool = TyBool
  | otherwise = error "type error in && (and)"
checkExp env (RelOp e1 Or e2)
  | (checkExp env e1) == TyBool && (checkExp env e2) == TyBool = TyBool
  | otherwise = error "type error in || (or)"
checkExp env (FunCall f []) = getFunType (findType env f)
checkExp env (FunCall f args)
  | (getArgs env args) == (getArgTypes (findType env f)) = getFunType (findType env f)
  | otherwise = error "invalid argument types"
checkExp env x = error (show x)

checkStm :: [Env] -> Stmt -> Bool
checkStm env (Assign id expr)
  | ((checkExp env expr) == (findType env id)) = True
  | otherwise = error ("type error in assign")
checkStm env (If cond stm1) 
  | (checkExp env cond) == TyBool && (checkStm env stm1) == True = True
  | otherwise = error ("type error in if")
checkStm env (IfElse cond stm1 stm2) 
  | (checkExp env cond) == TyBool && (checkStm env stm1) == True && (checkStm env stm2) == True = True
  | otherwise = error ("type error in if then else")
checkStm env (While cond stm)
  | ((checkExp env cond) == TyBool) && (checkStm env stm) = True
  | otherwise = error "type error in while"
checkStm env (For _ cond _ stm)
  | ((checkExp env cond) == TyBool) && (checkStm env stm) = True
  | otherwise = error "type error in for"
checkStm env (Block stms)
  | (checkBlocks env stms) = True
  | otherwise = error "type error in block"
checkStm env (Return expr)
  | (checkExp env expr) == TyInt || (checkExp env expr) == TyBool = True
  | otherwise = error "type error in return"
checkStm env (Incr expr)
  | (checkExp env expr) == TyInt = True
  | otherwise = error "type error in ++ (increment)"
checkStm env (Decr expr)
  | (checkExp env expr) == TyInt = True
  | otherwise = error "type error in -- (decrement)"
checkStm env (ExpSimple expr)
  | (checkExp env expr) == TyInt || (checkExp env expr) == TyBool = True
  | otherwise = error "type error in ExpSimple"

checkBlocks :: [Env] -> [Stmt] -> Bool
checkBlocks env [] = True
checkBlocks env (x:xs) = (checkStm env x) && (checkBlocks env xs)

getArgs :: [Env] -> [Exp] -> [Tp]
getArgs env [] = []
getArgs env (x:xs) = [checkExp env x] ++ getArgs env xs

getArgTypes :: Tp -> [Tp]
getArgTypes (TyFun args _) = args
getArgTypes x = error "?"

getFunType :: Tp -> Tp
getFunType (TyFun _ result) = result
getFunType x = error "?"

checkArgs :: [Tp] -> [Tp] -> Bool
checkArgs [] [] = True
checkArgs _ [] = False
checkArgs [] _ = False
checkArgs (x:xs) (y:ys) 
    | x == y = checkArgs xs ys
    | otherwise = False