(lang dune 3.7)
(using menhir 2.1)
(name interpreter)
(generate_opam_files true)
(source
 (github rodrigoaraujo9/lambda-calculus-interpreter))
(authors "Rodrigo Araújo" "Diogo Araújo")
(maintainers "Rodrigo Araújo" "Diogo Araújo")
(license MIT)
(package
 (name interpreter)
 (synopsis "Lambda Calculus Interpreter in OCaml")
 (description "A simple interpreter for lambda calculus expressions with constants, variables, lambda abstractions, and function applications")
 (depends ocaml dune)
 (tags
  (topics "lambda calculus" interpreter functional)))
