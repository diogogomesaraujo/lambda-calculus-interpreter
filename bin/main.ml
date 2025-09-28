open Interpreter

let rec main () =
  print_endline "Write a λ-Calculus expression to be reduced: ";
  print_string "> ";
  let i = read_line () in
  let parsed = Parse.parse i in
  let reduced = Eval.eval parsed in
  Printf.printf ">> %s\n" (Encode.to_string reduced);
  main ()

let () = main ()
