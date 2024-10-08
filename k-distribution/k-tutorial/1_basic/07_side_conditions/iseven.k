module ISEVEN
    imports INT
    imports INT-SYNTAX
    imports BOOL
    syntax Bool ::= isEven(Int) [function]
    
    rule isEven(I) => true requires (I %Int 2) ==Int 0
    rule isEven(_) => false [owise]
endmodule
