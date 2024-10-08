module CONCAT
    imports STRING
    syntax Strings ::= List{String, ","}
    syntax Exp 	::= 	String
		|	concat(Strings) [function]
    
    rule concat(.Strings) => ""
    rule concat(S) => S
    rule concat(S1, S2, Is:Strings) => concat(S1 +String S2, Is)

    
endmodule
