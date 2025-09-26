%{
    open Ast
%}

%token <int> INT
%token <string> ID

%token LPAR
%token RPAR

%token LAMBDA

%token SEPARATOR

%token EOF

%left LAMBDA SEPARATOR

%start <Ast.expr> prog
%%

prog:
  | e = expr; EOF { e }
  ;

expr:
  | i = INT { Const i }
  | id = ID { Var id }
  | LAMBDA; s = ID; SEPARATOR; e = expr { Lamda(s , e) }
  | LPAR; e1 = expr; RPAR; LPAR; e2 = expr; RPAR; { Application(e1 , e2) }
  | LPAR; e = expr; RPAR {e}
  ;
