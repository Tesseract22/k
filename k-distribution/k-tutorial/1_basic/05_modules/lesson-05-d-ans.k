module SYNTAX
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
endmodule

module NOT-1
    imports SYNTAX
    rule not false => true
endmodule

module NOT-2
    imports SYNTAX
    rule not true => false
endmodule

module LESSON-05-D-ANS
  imports NOT-1
  imports NOT-2
endmodule
