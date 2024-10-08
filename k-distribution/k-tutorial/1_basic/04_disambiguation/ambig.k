module AMBIG

  syntax Exp ::= "true" | "false"
  syntax Stmt ::= "if" "(" Exp ")" Stmt
                | "if" "(" Exp ")" Stmt "else" Stmt
                | "{" "}"
endmodule
