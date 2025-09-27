(** Function that encodes a given expression [e] into string formatting.*)
let to_string e =
  let rec encode_rec e s =
    match e with
    | Ast.Const c -> s ^ (string_of_int c)
    | Ast.Var v -> s ^ v
    | Ast.Application (e1, e2) -> Printf.sprintf "%s(%s)%s" s (encode_rec e1 "") (encode_rec e2 "")
    | Ast.Lambda (v, e) -> Printf.sprintf "%sλ%s.%s" s v (encode_rec e "")
  in
  encode_rec e ""
