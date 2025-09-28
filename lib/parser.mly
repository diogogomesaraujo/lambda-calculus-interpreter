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
  | applic {$1}
  | LAMBDA; s = ID; SEPARATOR; e = expr { Lambda(s , e) }
  ;

applic:
  | atomic {$1}
  | e1 = applic; e2 = atomic { Application(e1 , e2) }
  ;

atomic:
  | i = INT { Const i }
  | id = ID { Var id }
  | LPAR; e = expr; RPAR {e}
  ;
