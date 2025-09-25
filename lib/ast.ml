type id = string

type expr =
  | Var of string
  | Lamda of string * expr
  | Application of expr * expr
[@@deriving show]
