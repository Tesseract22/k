requires "lesson-22.k"
requires "domains.md"

module LESSON-22-SPEC-SYNTAX
    imports LESSON-22-SYNTAX

endmodule

module VERIFICATION
    imports K-EQUAL
    imports LESSON-22-SPEC-SYNTAX
    imports LESSON-22
    imports MAP-SYMBOLIC

    rule maxInt(I1:Int, I2:Int) => I1 requires I1 >=Int I2 [simplification]
    rule maxInt(I1:Int, I2:Int) => I2 requires I1 <Int I2 [simplification]

endmodule

module LESSON-22-SPEC
    imports VERIFICATION
    syntax Id ::= "$a" [token] | "$b" [token] | "$c" [token]
    claim <k> 3 + 4 => 7 ... </k>
    claim <k> if ( 3 + 4 != 7 ) {
            $a = 1 ;
            } else {
            $a = 2 ;
            }
        => . ... </k>
        <store> STORE => STORE [ $a <- 2 ] </store>


    claim <k> $a = A:Int ; $b = B:Int ;
          if ($a < $b) {
            $c = $b ;
          } else {
            $c = $a ;
          }
        => . ... </k>
        <store> STORE => STORE [ $a <- A ] [ $b <- B ] [ $c <- ?C:Int ] </store>
   ensures (?C ==Int maxInt(A, B)) 

    claim
        <k>
            while ( 0 < $b ) {
                $a = $a + $c;
                $b = $b - 1;
                $c = $c - 1;
            } => . ...
        </k>
        <store>
            $a |-> (S:Int => S +Int ((C +Int C -Int B +Int 1) *Int B divInt 2))
            $b |-> (B:Int => 0)
            $c |-> (C:Int => C -Int B)
        </store>
        requires B >=Int 0
    claim
	<k>
	    def main (a) { }

	    => . ...

	</k>

endmodule
