module INTEGER
    imports INT
    imports INT-SYNTAX
    imports BOOL
    imports BOOL-SYNTAX
    syntax Exp	::= 	Int [group(literal)]
		|	"(" Exp ")" [bracket, group(atom)]
		|	"-" Exp [group(neg), function]
		|	Exp "/" Exp [group(mul), function]
		|	Exp "*" Exp [group(mul), function]
		|	Exp "+" Exp [group(add), function]
		|	Exp "-" Exp [group(add), function]
	
    syntax priority literal atom > neg > mul > add
    syntax left mul
    syntax non-assoc cmp


    rule - A => 0 -Int A
    rule A + B => A +Int B 
    rule A - B => A -Int B 
    rule A * B => A *Int B 
    rule A / B => A /Int B

endmodule
