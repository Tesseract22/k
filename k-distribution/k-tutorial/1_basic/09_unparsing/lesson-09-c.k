module LESSON-09-C
  imports BOOL

  syntax CBool ::= "true" [color(Red)] | "false" [color(Red)]
  syntax Stmt ::= "{" Stmt "}" [format(%1%n%i%2%d%n%3), color(Green)] | "{" "}" [format(%1%n%2), color(Green)]
                > right:
                  Stmt Stmt [format(%1%n%2)]
                | "if" "(" CBool ")" Stmt [format(%1 %2%3%4%n%5), colors(Blue, Green, Green)]
                | "if" "(" CBool ")" Stmt "else" Stmt [avoid, format(%1 %2%3%4%n%5%n%6%n%7), colors(Blue, Green, Green, Blue)]
endmodule
