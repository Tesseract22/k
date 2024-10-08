module INTEGER
    syntax Int ::= r"[0-9]+" [prec(2), token]
    syntax Exp	::= 	Int [group(literal)]
		|	"(" Exp ")" [bracket, group(atom)]
		|	"-" Exp [group(neg)]
		|	Exp "/" Exp [group(mul)]
		|	Exp "*" Exp [group(mul)]
		|	Exp "+" Exp [group(add)]
		|	Exp "-" Exp [group(add)]
    syntax priority literal atom > neg > mul > add
    syntax left mul
    syntax left add
endmodule
