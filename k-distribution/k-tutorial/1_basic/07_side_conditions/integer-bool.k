module INTEGER-BOOL
    imports INT
    imports INT-SYNTAX
    imports BOOL
    imports BOOL-SYNTAX
    syntax Exp	::= 	Int [group(literal)]
		|	Bool [group(literal)]
		|	"(" Exp ")" [bracket, group(atom)]
		|	"-" Exp [group(neg), function]
		|	Exp "/" Exp [group(mul), function]
		|	Exp "*" Exp [group(mul), function]
		|	Exp "+" Exp [group(add), function]
		|	Exp "-" Exp [group(add), function]
		|	Exp "<" Exp  [group(cmp), function]	
		|	Exp "<=" Exp [group(cmp), function]	
		|	Exp ">" Exp  [group(cmp), function]	
		|	Exp ">=" Exp [group(cmp), function]
		|	Exp "==" Exp [group(cmp), function]	
		|	Exp "!=" Exp [group(cmp), function]	


    syntax priority literal atom > neg > mul > add > cmp
    syntax left mul
    syntax left add
    syntax non-assoc cmp


    rule - A => 0 -Int A
    rule A + B => A +Int B 
    rule A - B => A -Int B 
    rule A * B => A *Int B 
    rule A / B => A /Int B requires B =/=Int 0

    rule A >= B => A >=Int B
    rule A > B => A >Int B
    rule A < B => A <Int B
    rule A <= B => A <=Int B
    rule A == B => A ==Int B
    rule A != B => notBool (A ==Int B)
endmodule
