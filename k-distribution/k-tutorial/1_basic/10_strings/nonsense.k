module NONSENSE
    imports STRING
    imports INT
    imports INT-SYNTAX
    syntax Exp	::= 	Int	
		|	String
		|	nonsense(Exp) [function]
		|	firstWord(Exp) [function]
		|	substr(Exp, Exp, Exp)	[function]
	    

		> left:	
			Exp "++" Exp	[function]
		|	Exp "+" Exp	[function]
	    rule S1 ++ S2 => S1 +String S2
    rule I1 + I2 => I1 +Int I2
    rule substr(E1, E2, E3) => substrString(E1, E2, E3)
    rule firstWord(S:String) => S requires findChar(S, " ", 0) ==Int -1 [priority(10)]
    rule firstWord(S:String) => substrString(S, 0, findChar(S, " ", 0))  [priority(20)]
    rule nonsense(S) => "" requires findChar(S, ".", 0) ==Int -1 [priority(10)]
    rule nonsense(S) => firstWord(substr(S, 0, findChar(S, ".", 0))) 
	++ "." 
	++ nonsense(substr(S, findChar(S, ".", 0) + 1, lengthString(S))) [priority(20)]
endmodule
