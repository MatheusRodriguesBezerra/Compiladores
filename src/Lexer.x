{
module Lexer where
}

%wrapper "basic"

$white =  [\ \t\n\r]
$alpha = [_a-zA-Z]
$digit =  [0-9]
@comment = ( [^\*] | \*[^\)] | \*\n | \n )*

tokens :-

$white+  ; -- ignorar carateres brancos
"//" .*  ;
"/*" @comment "*/"   ;   -- ignore comments

"++"       { \_ -> INCR }
"--"       { \_ -> DECR }
"+"       { \_ -> PLUS }
"-"       { \_ -> MINUS }
"*"       { \_ -> MULT }
"/"       { \_ -> DIV }
"("       { \_ -> LPAREN }
")"       { \_ -> RPAREN }
"{"       { \_ -> LBRACE }
"}"       { \_ -> RBRACE }
"["       { \_ -> LBRACK }
"]"       { \_ -> RBRACK }
"!"       { \_ -> NOT }
"&&"       { \_ -> AND }
"||"       { \_ -> OR }
","       { \_ -> COMMA }
";"       { \_ -> SEMICOLON }
"if"      { \_ -> IF }
"else"      { \_ -> ELSE }
"%"       { \_ -> MODULE }
"while"   { \_ -> WHILE }
"for"     { \_ -> FOR }
"=="      { \_ -> EQUALS }
"="      { \_ -> EQUAL }
"!="      { \_ -> NOTEQUALS }
">="      { \_ -> GETHAN }
"<="      { \_ -> LETHAN }
">"       { \_ -> GTHAN }
"<"       { \_ -> LTHAN }
"true"    { \_ -> TRUE }
"false"   { \_ -> FALSE }
"NULL"    { \_ -> NULL }
"int"     { \_ -> INT}
"bool"     { \_ -> BOOL}
"return"  { \_ -> RETURN }
"break"  { \_ -> BREAK }
"continue"  { \_ -> CONTINUE }
"string" { \_ -> STRING }
"char" { \_ -> CHAR }
"void" { \_ -> VOID }



$alpha($alpha|$digit)* { \s -> ID s }
$digit+ { \s -> NUM (read s) }
$digit+"."$digit+ { \s -> REAL (read s) }


-- NOTA:
-- como vamos apenas reconhecer expressões bem-formadas
-- não necessitamos de associar um valor ao *token* NUM

{

data Token
  = PLUS
  | MINUS
  | MULT
  | DIV
  | INCR
  | DECR
  | LPAREN
  | RPAREN
  | RBRACE
  | LBRACE
  | RBRACK
  | LBRACK
  | ELSE
  | NULL
  | MAIN
  | NOT
  | AND
  | OR
  | COMMA
  | SEMICOLON
  | IF
  | MODULE
  | WHILE
  | FOR
  | EQUAL
  | EQUALS
  | NOTEQUALS
  | GTHAN
  | LTHAN
  | GETHAN
  | LETHAN
  | TRUE
  | FALSE
  | SQRT
  | LOG
  | EXP
  | INT
  | BOOL
  | RETURN 
  | BREAK 
  | CONTINUE 
  | STRING
  | CHAR
  | VOID
  | ID String
  | NUM Int
  | REAL Double 
  deriving (Eq, Show)

}  
