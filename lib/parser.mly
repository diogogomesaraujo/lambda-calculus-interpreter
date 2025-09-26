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

%start <Ast.expr> prog
%%

prog:
  | e = expr; EOF { e }
  ;

expr:
  | app_expr { $1 }
  | LAMBDA; s = ID; SEPARATOR; e = expr { Lambda(s , e) }
  ;

app_expr:
  | simple_expr { $1 }
  | app_expr; simple_expr { Application($1 , $2) }
  ;

simple_expr:
  | i = INT { Const i }
  | id = ID { Var id }
  | LPAR; e = expr; RPAR { e }
  ;
