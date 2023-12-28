{
module Parser where
import Lexer  
import AST   
}

%name parser
%tokentype { Token }
%error { parseError }

%token

id  { ID $$ }
num { NUM $$ }
'+'  { PLUS }
'-'  { MINUS }
'/'  { DIV }
'*'  { MULT }
'%'  { MODULE }
'++' { INCR }
'--' { DECR }
'('  { LPAREN }
')'  { RPAREN }
'{'       { LBRACE }
'}'       { RBRACE }
'['       { LBRACK }
']'       { RBRACK }
'!'       { NOT }
'&&'       { AND }
'||'       { OR }
','       { COMMA }
';'       { SEMICOLON }
'if'      { IF }
'else'    { ELSE }
'while'   { WHILE }
'for'     { FOR }
'='      { EQUAL }
'=='      { EQUALS }
'!='      { NOTEQUALS }
'>'       { GTHAN }
'<'       { LTHAN }
'>='      { GETHAN }
'<='      { LETHAN }
'true'    { TRUE }
'false'   { FALSE }
'null'    { NULL }
'int'     { INT}
'bool'     { BOOL}
'return'  { RETURN }
'break'  { BREAK }
'continue'  { CONTINUE }
'string'   { STRING }
'char'   { CHAR }
'void'   { VOID }

%left '||'
%left '&&'
%left '==' '!='
%left '<' '>' '<=' '>='
%left '+' '-'
%left '*' '/' '%'
%right '!' '++' '--'

%%

-- Inicio do programa
Prog : ProgList { Program $1 }


ProgList : Function ProgList    { $1 : $2 }
    | {- empty -}               { [] }


Function : Tp id '(' TypeParam ')' '{' Declares Stmts '}'            { Function $1 $2 $4 $7 $8 } -- <tp> <vid> ( <tp> <vid> (, <tp> <vid>)* ) { <stmt>* }

TypeParam : Params        { $1 }
    | {- empty -}       { [] }

Params : ParamDecl ',' Params           { $1 : $3 } -- (, <tp> <vid>)*
    | ParamDecl                                 { [$1] }


ParamDecl : Tp id { Param $1 $2 }


Stmt : 'if' '(' Exp ')' Stmt 'else' Stmt            { IfElse $3 $5 $7 }  --  if ( <exp> ) <stmt> else <stmt> 
    | 'if' '(' Exp ')' Stmt                         { If $3 $5 }         --  if ( <exp> ) <stmt>
    | 'while' '(' Exp ')' Stmt                      { While $3 $5 }      -- while ( <exp> ) <stmt>
    | 'for' '(' Simple ';' Exp ';' Simple ')' Stmt  { For $3 $5 $7 $9 } -- for ( <simple> ; <exp> ; <simple> ) <stmt>
    | 'break' ';'                                   { Break }            -- break ;
    | 'continue' ';'                                { Continue }         -- continue ;
    | '{' Stmts '}'                                 { Block $2 }         --  { <stmt>* }
    | 'return' Exp ';'                              { Return $2 }        -- return <exp> ;
    | 'return' ';'                                  { ReturnNull }       -- return ;
    | Simple ';'                                    { $1 }    -- <simple> ;

Declares : Declare Declares { $1 : $2 }
    | {- empty -}       { [] }

Declare : Tp id ';'                 { DeclareId $1 $2 }           -- <tp> <vid>

Stmts : Stmt Stmts      { $1 : $2 } -- <stmt>*
    | {- empty -}       { [] }


Simple : Exp '++'                { Incr $1 }                    -- <lv> ++
    | Exp '--'                   { Decr $1 }                    -- <lv> --
    | id '=' Exp                { Assign $1 $3 }               -- <tp> <vid> = <exp>
    | Exp                       { ExpSimple $1 }               -- <exp>


Tp : 'int'      { TyInt }      -- int
    | 'bool'    { TyBool }     -- bool 


-- remaining FuncWithParam
Exp : num                       { Num $1 }
    | 'true'                    { TrueConst }
    | 'false'                   { FalseConst }
    | 'null'                    { Null }
    | id                        { VarExp $1 }
    | '!' Exp                   { Not $2 }
    | id '(' ExpList ')'        { FunCall $1 $3 }
    | Exp BiOp Exp             { BinOp $1 $2 $3 }
    | Exp ReOp Exp              { RelOp $1 $2 $3 }
    | '(' Exp ')'               { $2 }


ExpList : Exp Exps      { $1 : $2 }
    | {- empty -}       { [] } 


Exps : ',' Exp Exps     { $2 : $3 }
    | {- empty -}       { [] }


ReOp : '||'      { Or }
    | '&&'      { And }
    | '=='      { EqualsThan }               -- '=='
    | '!='      { DiffThan }                 -- '!='
    | '>='      { GreaterEqualsThan }        -- '>='
    | '>'       { GreaterThan }               -- '>'
    | '<='      { LowerEqualsThan }          -- '<='
    | '<'       { LowerThan }                 -- '<'

BiOp : '+'     { Add }                         -- '+' 
    | '-'       { Minus }                       -- '-'
    | '*'       { Mult }                        -- '*'
    | '/'       { Div }                         -- '/'
    | '%'       { Mod }                         -- '%'


{

parseError :: [Token] -> a
parseError toks = error ("parse error at" ++ show toks)

}