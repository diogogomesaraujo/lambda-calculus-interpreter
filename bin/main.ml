open Interpreter

let () =
  let e = Parse.parse "(λp.λq.pqp)2" in
  let e = Eval.eval e in
  Encode.to_string e |> print_endline


(* Test cases for lambda calculus interpreter *)

let test_cases = [
  (* 1. Simple identity function *)
  "(λx.x)5";

  (* 2. Constant function (K combinator) *)
  "(λx.λy.x)3 4";

  (* 3. Self-application *)
  "(λx.xx)(λy.y)";

  (* 4. Variable capture scenario *)
  "(λx.λy.x)(λz.z)";

  (* 5. Function composition-like *)
  "(λf.λx.f(fx))(λy.yy)1";

  (* 6. Same variable names *)
  "(λx.x)(λx.xx)";

  (* 7. Triple nested application *)
  "(λx.λy.λz.xyz)1 2 3";

  (* 8. Free variable (should stay free) *)
  "(λx.y)5";

  (* 9. Complex Church numeral application *)
  "(λf.λx.f(f(fx)))(λy.yy)1";

  (* 10. No reduction possible *)
  "λx.λy.xy"
]

let run_tests () =
  List.iteri (fun i test_expr ->
    Printf.printf "\n=== Test %d: %s ===\n" (i+1) test_expr;
    try
      let parsed = Parse.parse test_expr in
      Printf.printf "Parsed: %s\n" (Encode.to_string parsed);

      let result = Eval.eval parsed in
      Printf.printf "Result: %s\n" (Encode.to_string result);
    with
    | e -> Printf.printf "Error: %s\n" (Printexc.to_string e)
  ) test_cases

let () = run_tests ()
