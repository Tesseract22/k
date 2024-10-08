module LESSON-02-A-ANS

  syntax BlackOrWhite ::= Black() | White()
  syntax Color ::= Yellow() | Blue() | Green() | BlackOrWhite
  syntax Fruit ::= Banana() | Blueberry() | Blackberry() | Kiwi()
  syntax Boolean ::= true() | false()

  syntax Hat ::= Hat(BlackOrWhite)
  syntax Shirt ::= Shirt(BlackOrWhite) 
  syntax Pant ::= Pant(BlackOrWhite)
  syntax Shoe ::= Shoe(BlackOrWhite)

  syntax Outfit ::= Outfit(Hat, Shirt, Pant, Shoe)
  syntax Boolean ::= outfitMatching(Outfit) [function]

  syntax Color ::= colorOf(Fruit) [function]

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()
  rule colorOf(Blackberry()) => Black()
  rule colorOf(Kiwi()) => Green()

  rule outfitMatching(Outfit( 
    Hat(Black()), 
    Shirt(Black()), 
    Pant(Black()), 
    Shoe(Black())
  )) => true()

  rule outfitMatching(Outfit( 
    Hat(White()), 
    Shirt(White()), 
    Pant(White()), 
    Shoe(White())
  )) => true()
  rule outfitMatching(_) => false() [owise]


  

endmodule

