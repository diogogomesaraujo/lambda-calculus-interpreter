(** Function that encodes a given expression [e] into string formatting.*)
let to_string e =
  let rec encode_rec e s =
    match e with
    | Ast.Const c -> s ^ string_of_int c
    | Ast.Var v -> s ^ v
    | Ast.Application (e1, e2) ->
      let left = match e1 with
        | Ast.Const _ | Ast.Var _ -> encode_rec e1 ""
        | _ -> "(" ^ (encode_rec e1 "") ^ ")"
      in
      let right = match e2 with
        | Ast.Const _ | Ast.Var _ -> encode_rec e2 ""
        | _ -> "(" ^ (encode_rec e2 "") ^ ")"
      in
      Printf.sprintf "%s%s%s" s left right
    | Ast.Lambda (v, e) -> Printf.sprintf "%sλ%s.%s" s v (encode_rec e "")
  in
  encode_rec e ""
