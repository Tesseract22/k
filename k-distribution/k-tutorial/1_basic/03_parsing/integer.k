module INTEGER
    syntax Int ::= r"[0-9]+" [prec(2), token]
    syntax Exp	::= 	Int
		|	"(" Exp ")" [bracket]
		|	"-" Exp
		|	Exp "+" Exp
		|	Exp "-" Exp
		|	Exp "/" Exp
		|	Exp "*" Exp
endmodule
