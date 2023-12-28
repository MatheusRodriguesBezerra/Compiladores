module AST where

data Prog = Program [Function]
    deriving Show

data Function = Function Tp String [ParamDecl] [Declare] [Stmt]
    deriving Show

data ParamDecl = Param Tp String
    deriving Show

data Stmt = IfElse Exp Stmt Stmt 
    | If Exp Stmt
    | While Exp Stmt 
    | For Stmt  Exp  Stmt Stmt 
    | Break
    | Continue
    | Block [Stmt]
    | Return Exp 
    | ReturnNull
    | Incr Exp 
    | Decr Exp
    | Assign String Exp
    | ExpSimple Exp 
    deriving Show

data Declare = DeclareId Tp String
    deriving Show

data Tp = TyInt 
    | TyBool 
    | TyFun [Tp] Tp
    deriving (Eq, Show)

data Exp = Num Int
    | VarExp String 
    | BinOp Exp BiOp Exp
    | RelOp Exp ReOp Exp
    | TrueConst 
    | FalseConst 
    | Null 
    | Not Exp 
    | FunCall String [Exp]
    deriving Show

data ReOp = Or 
    | And 
    | EqualsThan 
    | DiffThan 
    | GreaterEqualsThan 
    | GreaterThan 
    | LowerEqualsThan 
    | LowerThan
    deriving (Eq, Show)

data BiOp = Add 
    | Minus 
    | Mult 
    | Div 
    | Mod 
    deriving Show