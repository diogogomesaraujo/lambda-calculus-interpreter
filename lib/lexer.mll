{
open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let int = '-'? digit+

rule read =
    parse
    | white { read lexbuf }
    | int { INT (int_of_string (Lexing.lexeme lexbuf))}
    | "(" { LPAR }
    | ")" { RPAR }
    | "λ" { LAMBDA }
    | "." { SEPARATOR }
    | ['a'-'z' 'A'-'Z' '_'] { ID (Lexing.lexeme lexbuf) }
    | eof { EOF }
