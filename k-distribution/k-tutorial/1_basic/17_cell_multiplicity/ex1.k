module EX1
    imports LIST
    imports INT

    configuration	<k> $PGM:Stmts </k>
			<optional multiplicity="?"> 0 </optional> 

    syntax Stmt ::= "enable" | "increment" | "decrement" | "disable"
    syntax Stmts ::= List{Stmt, ""}

    rule <k> S:Stmt SS:Stmts => S ~> SS ...</k> 
    rule <k> .Stmts => . ...</k>


    rule <k> enable => . ...</k>
	 (.Bag => <optional>0</optional>)	
    rule <k> disable => . ...</k>
	 (<optional>_</optional> => .Bag)
    rule <k> increment => . ...</k>
	 <optional>I:Int => I +Int 1</optional>
    rule <k> decrement => . ...</k>
	 <optional>I:Int => I -Int 1</optional>


endmodule
