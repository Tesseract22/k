module PEANO
    syntax Nat 	::= "0"
		|	S(Nat)
		| Nat "+" Nat [macro]
   
   rule N:Nat + 0 => N
   rule N1:Nat + S(N2:Nat) => S(N1) + N2


endmodule
