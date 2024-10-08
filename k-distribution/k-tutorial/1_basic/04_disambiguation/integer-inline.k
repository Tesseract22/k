module INTEGER
    syntax Int ::= r"[0-9]+" [prec(2), token]
    syntax Exp	::= 	Int
		|	"(" Exp ")" [bracket]	
		>	"-" Exp
		> left:
			Exp "/" Exp
		|	Exp "*" Exp
		> left:
			Exp "+" Exp
		|	Exp "-" Exp
endmodule
