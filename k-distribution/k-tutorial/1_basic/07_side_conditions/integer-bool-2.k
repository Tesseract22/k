module INTEGER-BOOL-2
    imports INT
    imports INT-SYNTAX
    imports BOOL
    imports BOOL-SYNTAX
    syntax Exp	::= 	Int [group(literal)]
		|	"(" Exp ")" [bracket, group(atom)]
		|	"abs" "(" Exp ")" [group(atom), function]
		|	"-" Exp [group(neg), function]
		|	Exp "/" Exp [group(mul), function]
		|	Exp "*" Exp [group(mul), function]
		|	Exp "+" Exp [group(add), function]
		|	Exp "-" Exp [group(add), function]
		|	Exp "<" Exp [group(cmp)]	
		|	Exp "<=" Exp [group(cmp)]	
		|	Exp ">" Exp [group(cmp)]	
		|	Exp ">=" Exp [group(cmp)]
		|	Exp "==" Exp [group(cmp)]	
		|	Exp "!=" Exp [group(cmp)]	


    syntax priority literal atom > neg > mul > add > cmp
    syntax left mul
    syntax left add
    syntax non-assoc cmp
    
    rule abs(A) => absInt(A)
    rule - A => 0 -Int A
    rule A + B => A +Int B 
    rule A - B => A -Int B 
    rule A * B => A *Int B 
    rule A / B => A /Int B requires B =/=Int 0

    rule 0 == 0 => true [priority(10)]
    rule _I == 0 => false [priority(11)]
    rule I1 == I2 => I1 - I2 == 0 [priority(20)]

    rule 0 != 0 => false [priority(10)]
    rule _I != 0 => true [priority(11)]
    rule I1 != I2 => I1 - I2 != 0 [priority(20)]

    rule 0 > 0 => false	[priority(10)]
    rule I > 0 => abs(I) == I [priority(20)]
    rule I1 > I2 => I1 - I2 > 0 [priority(30)]     

    rule 0 >= 0 => true [priority(10)]
    rule I >= 0 => abs(I) == I [priority(20)]
    rule I1 >= I2 => I1 - I2 >= 0 [priority(30)]     

    rule 0 < 0 => false [priority(10)]
    rule I < 0 => abs(I) == I [priority(20)]
    rule I1 < I2 => I1 - I2 < 0 [priority(30)]

    rule 0 <= 0 => true [priority(10)]
    rule I <= 0 => abs(I) == I [priority(20)]
    rule I1 <= I2 => I1 - I2 <= 0 [priority(30)]




endmodule
