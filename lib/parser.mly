%{
    open Ast
%}

%token <int> INT
%token <string> ID

%token LPAR
%token RPAR

%token LAMBDA

%token SEPARATOR

%token APPLICATION

%token EOF

%right LAMBDA SEPARATOR
%left APPLICATION

%start <Ast.expr> prog
%%

prog:
  | e = expr; EOF { e }
  ;

expr:
  | i = INT { Const i }
  | id = ID { Var id }
  | LAMBDA; s = ID; SEPARATOR; e = expr { Lambda(s , e) }
  | e1 = expr; e2 = expr; { Application(e1 , e2) } %prec APPLICATION
  | LPAR; e = expr; RPAR {e}
  ;
