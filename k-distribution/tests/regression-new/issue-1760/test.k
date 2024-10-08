// Copyright (c) Runtime Verification, Inc. All Rights Reserved.
module TEST-SYNTAX

  syntax TokKat ::= "ZERO"  [token]
          |"ONE" [token]

  syntax Kat ::= TokKat [hook(KAT.Kat)]
  syntax Kat ::= ".Kat" [function, total, hook(KAT.empty), impure]

endmodule

module TEST
  imports BASIC-K
  imports TEST-SYNTAX
  imports BOOL
  imports K-EQUAL
// --------------------------------------------------------------------------------
// Boolean Algebra Part of KAT

  syntax Kat ::= Bool
                | "notKat" Kat          [function, total, symbol(notKat_), smt-hook(not), group(boolOperation), hook(KAT.not)]
                > Kat "andKat" Kat     [function, total, symbol(_andKat_), left, smt-hook(and), group(boolOperation), hook(KAT.and)]
                | Kat "orKat" Kat      [function, total, symbol(_orKat_), left, smt-hook(or), group(boolOperation), hook(KAT.or)]
                | Kat "=/=Kat" Kat     [function, total, symbol(_=/=Kat_), left, smt-hook(distinct), hook(KAT.ne)]
                //| Kat "impliesKat" Kat [function, total, symbol(_impliesKat_), left, smt-hook(=>), group(boolOperation), hook(KAT.implies)]

  syntax Bool ::= Kat "==Kat" Kat      [function, total, symbol(_==Kat_), left, smt-hook(=), hook(KAT.eq)]


  syntax Kat ::= freshKat(Kat)    [freshGenerator, function]
  rule freshKat(I:Kat) => I

  rule notKat ONE => ZERO
  rule notKat ZERO => ONE

  rule ONE andKat B:Kat => B:Kat
  rule B:Kat andKat ONE => B:Kat
  rule ZERO andKat _:Kat => ZERO
  rule _:Kat andKat ZERO => ZERO

  rule ONE orKat _:Kat => ONE
  rule _:Kat orKat ONE => ONE
  rule ZERO orKat B:Kat => B
  rule B:Kat orKat ZERO => B

/*
  rule ONE impliesKat B:Kat => B
  rule ZERO impliesKat _:Kat => ONE
  rule _:Kat impliesKat ONE => ONE
  rule B:Kat impliesKat ZERO => notKat B

*/


  // ----------- MODIFICATIONS for KAT ----
  rule I1:Kat =/=Kat I2:Kat => notKat(I1 ==Kat I2)
  rule B1:Kat ==Kat B2:Kat =>  (B1 ==K B2)

  rule true:Bool => ONE
  rule false:Bool => ZERO

 // --------------------------------------------------------------------------------
  // Kleene Algebra Part of KAT


/*
    syntax Kat ::= "(" Kat ")"         [bracket]
                 > left:
                   Kat "Kat*"           [function, symbol(_starKat), left, smtlib(ka_star), hook(KAT.mul)]
                 > left:
                   Kat "Kat;" Kat       [function, symbol(_seqKat_), left, smtlib(ka_seq), hook(KAT.seq)]
                 > left:
                   Kat "Kat|" Kat       [function, symbol(_pllKat_), left, smtlib(ka_pll), hook(KAT.pll)]

*/

    syntax Kat ::= "(" Kat ")"         [bracket]
                 > left:
                   Kat "Kat*"           [function, symbol(_starKat), left, smtlib(ka_star), hook(KAT.mul)]
                | Kat "Kat;" Kat       [function, symbol(_seqKat_), left, smtlib(ka_seq), hook(KAT.seq)]
                | Kat "Kat|" Kat       [function, symbol(_pllKat_), left, smtlib(ka_pll), hook(KAT.pll)]


     rule ONE Kat; B:Kat => B:Kat
     rule B:Kat Kat; ONE => B:Kat
     rule ZERO Kat; _:Kat => ZERO
     rule _:Kat Kat; ZERO => ZERO

     // general sequential operation; why shouldn't this be used?
     // rule A:Kat Kat; B:Kat => A ~> B


     rule ONE Kat| _:Kat => ONE
     rule _:Kat Kat| ONE => ONE
     rule ZERO Kat| B:Kat => B
     rule B:Kat Kat| ZERO => B

    // Kleene-Star Operator:

     rule _B:Kat Kat* => .Kat
     rule B:Kat Kat* => B
     rule B:Kat Kat* => B Kat; (B Kat*)



endmodule
