module ATOMIC
    syntax Int ::= r"[0-9]+" [prec(2), token]
    syntax Exp	::= 	Int [group(literal)]
		|	"(" Exp ")" [bracket, group(atom)]
endmodule

module ADD
    syntax Exp 	::=	"-" Exp [group(neg)]
		|	Exp "+" Exp [group(add)]
		|	Exp "-" Exp [group(add)]

endmodule

module MUL
   syntax Exp 	::=	Exp "/" Exp [group(mul)]
		|	Exp "*" Exp [group(mul)]

   
endmodule

module INTEGER
    imports ATOMIC
    imports ADD
    imports MUL
    syntax priority literal atom > neg > mul > add
    syntax left mul
    syntax left add
endmodule
