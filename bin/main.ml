open Interpreter

let rec main () =
  print_endline "Write a λ-Calculus expression to be reduced: ";
  print_string "> ";
  let i = read_line () in
  match  Parse.parse i with
  | Some parsed ->
    let reduced = Eval.eval parsed in
    Printf.printf ">> %s\n" (Encode.to_string reduced);
    main ()
  | _ -> main ()

let () = main ()
