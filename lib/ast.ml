type id = string

type expr =
  | Const of int
  | Var of string
  | Lamda of string * expr
  | Application of expr * expr
[@@deriving show]
