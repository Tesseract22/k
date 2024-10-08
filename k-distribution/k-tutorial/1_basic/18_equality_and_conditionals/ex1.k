module EX1
  imports INT
  imports BOOL
  imports K-EQUAL

  syntax Exp ::= Int | Bool | Exp "==" Exp

  syntax Bool ::= isKResult(K) [function, symbol(isKResult)]
  rule isKResult(_:Int) => true
  rule isKResult(_:Bool) => true

  rule E1 == E2=> #if (E1 ==K E2) #then 0 #else 1 #fi
endmodule
