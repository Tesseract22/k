module LESSON-06-B-ANS
  imports BOOL

  syntax Fruit ::= Blueberry() | Banana() | Bananaberry()
  syntax Bool ::= isBlue(Fruit) [function]

  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false
  rule isBlue(Bananaberry()) => true


  syntax Bool ::= isYellow(Fruit) [function]
                | isBlueOrYellow(Fruit) [function]
		| isBlueAndNotYellow(Fruit) [function]

  rule isYellow(Banana()) => true
  rule isYellow(Blueberry()) => false
  rule isYellow(Bananaberry()) => true

  rule isBlueOrYellow(F) => isBlue(F) orBool isYellow(F)
  rule isBlueAndNotYellow(F) => isBlue(F) andBool (notBool isYellow(F))
endmodule
