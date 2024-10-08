module LESSON-01
  imports BOOL

  syntax Stmt ::= "if" "(" Exp ")" Stmt             [alias]
                | "if" "(" Exp ")" Stmt "else" Stmt
                | "{" Stmts "}"
  syntax Stmts ::= List{Stmt,""}
  syntax Exp ::= Bool

  rule if ( E ) S => if ( E ) S else { .Stmts }
endmodule

