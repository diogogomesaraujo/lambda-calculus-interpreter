(** replace [var] with [sub]-> replacement in [expr] *)
let rec substitution expr var sub =
  match expr with
    | Ast.Const c -> Ast.Const c
    | Ast.Var v when  v = var -> sub
    | Ast.Var v -> Ast.Var v
    | Ast.Lambda (v, e) when v = var -> Ast.Lambda (v, e)
    | Ast.Lambda (v, e) -> Ast.Lambda (v, substitution e var sub)
    | Ast.Application (lambda, arg) -> Ast.Application(substitution lambda var sub, substitution arg var sub)

let beta expr =
  match expr with
    | Ast.Application(Ast.Lambda(v,e), arg) -> substitution e v arg
    | _ -> expr

let rec eval expr =
  match expr with
    | Ast.Application(lambda, arg) ->
      let eval_lambda = eval lambda in
      let eval_arg = eval arg in
      let reduced = beta (Ast.Application(eval_lambda, eval_arg)) in
      if reduced = Ast.Application(eval_lambda, eval_arg) then reduced else eval reduced
    | _ -> expr
