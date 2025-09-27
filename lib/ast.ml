type id = string

(** Defines every type of expression that the interpreter will be able to parse.*)
type expr =
  | Const of int
  | Var of string
  | Lambda of string * expr
  | Application of expr * expr
[@@deriving show]
