type id = string

type expr =
  | Const of int
  | Var of string
  | Lambda of string * expr
  | Application of expr * expr
[@@deriving show]
