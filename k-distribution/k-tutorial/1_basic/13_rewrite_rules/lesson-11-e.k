module LESSON-11-E
  imports INT
  imports BOOL

  syntax Exp ::= Int | Bool | Exp "+" Exp | Exp "&&" Exp

  syntax Empty ::= ""



  rule _:Empty => 0
  rule _:Empty => false

  rule 0 => 1
  rule false => true


endmodule
