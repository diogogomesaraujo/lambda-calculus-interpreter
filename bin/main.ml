open Interpreter

let () =
  let e = Parse.parse "(λp.λq.pqp)(λa.λb.a)(λa.λb.b)" in
  Encode.to_string e |> print_endline
