In this module, we are using Int and Bool
```k
module INTEGER-BOOL

    imports INT
    imports BOOL
    imports SET
    imports ID
    imports MAP
    imports SET
    imports LIST


```
This is the syntax for our language. It supports addition, subtraction, muliplication, and division. It also supports a unary operator `-`.
On top of that, we also have relational operator for integer.
```k
   
    syntax Exp	::= 	
            Int [group(literal)]
        |   Bool [group(literal)]
        |   Id  [group(literal)]
		|	"(" Exp ")" [bracket, group(atom)]
		|	"-" Exp [group(neg), function]
        |   Id "(" ")"
		|	Exp "/" Exp [group(mul), seqstrict, color(Blue)]
		|	Exp "*" Exp [group(mul), seqstrict, color(Blue)]
		|	Exp "+" Exp [group(add), seqstrict, color(Blue)]
		|	Exp "-" Exp [group(add), seqstrict, color(Blue)]
		|	Exp "<" Exp [group(cmp),  seqstrict, color(Green)]
		|	Exp "<=" Exp [group(cmp), seqstrict, color(Green)]	
		|	Exp ">" Exp [group(cmp),  seqstrict, color(Green)]	
		|	Exp ">=" Exp [group(cmp), seqstrict, color(Green)]
		|	Exp "==" Exp [group(cmp), seqstrict, color(Green)]	
		|	Exp "!=" Exp [group(cmp), seqstrict, color(Green)]

    syntax Stmt ::= "return" Exp ";" [strict(1)]
                |   Id "=" Exp ";" [strict(2)]
                |   "int" Id "=" Exp ";" [strict(2)]
    syntax Stmts ::= List{Stmt, ""} 
    syntax Decl ::= "fun" Id "(" ")" "{" Stmts "}"
    syntax Pgm  ::= List{Decl, ""}
    syntax Id   ::= "main" [token]

    configuration <T>
                  <k> $PGM:Pgm ~> main () </k>
                  <state> .Map </state>
                  <declared> .Set </declared>
                  <functions>
                    <function multiplicity="*" type="Map">
                        <name> main </name>
                        <body> .Stmts </body>
                    </function>
                  </functions>
                  <fstack> .List </fstack>
                 </T>

    // declaration sequence
    rule <k> D:Decl P:Pgm => D ~> P ...</k>
    rule <k> .Pgm => . ...</k>

    rule <k> S:Stmt SS:Stmts => S ~> SS ... </k>
    rule <k> .Stmts => . ... </k>
    
```
To disambiguate the grammar, we define priority and associativity. As usual, negtaion binds the tightest, and then mulplication/division, and then addition/subtraction.
```k
    syntax priority literal atom > neg > mul > add > cmp
    syntax left mul
    syntax left add
    syntax non-assoc cmp

```
Here is the semantics for this languge
```k
    syntax Bool ::= isKResult(K) [function, symbol(isKResult)]
    rule isKResult(_:Int) => true
    rule isKResult(_:Bool) => true
    rule isKResult(_) => false [owise]
    rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
    rule <k> I1:Int - I2:Int => I1 -Int I2 ...</k>
    rule <k> I1:Int * I2:Int => I1 *Int I2 ...</k>
    rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k> requires I2 =/=Int 0



    rule <k> I1:Int >= I2:Int => I1 >=Int I2 ...</k>
    rule <k> I1:Int <= I2:Int => I1 <=Int I2 ...</k>
    rule <k> I1:Int < I2:Int => I1 <Int I2 ...</k>
    rule <k> I1:Int > I2:Int => I1 >Int I2 ...</k>
    rule <k> I1:Int == I2:Int => I1 ==Int I2 ...</k>
    rule <k> I1:Int != I2:Int => I1 =/=Int I2 ...</k>

```
```k
    syntax KItem ::= stackFrame(K, Map, Set) // state and declared

    // function definitions
    rule <k> fun X:Id () { S } => . ...</k>
        (.Bag => <function> <name> X </name> <body> S </body> </function>)

    // return statement
    rule <k> return I ; ~> _ => I ~> K </k>
        <fstack> ListItem(stackFrame(K, S, D)) => .List ...</fstack>
        <state> _ => S </state>
        <declared> _ => D </declared>

    // varialbe assignment
    rule <k> X:Id = I;  => . ...</k>
        <state> STATE => STATE [ X <- I] </state>
        <declared>... SetItem(X) ...</declared>

    // variable declaration
    rule <k> int X:Id = I:Int ; => . ...</k>
        <state> STATE => STATE [ X <- I ] </state>
        <declared> D => D SetItem(X) </declared>
    requires notBool X in D

    // variable lookup
    rule <k> X:Id => I ...</k>
        <state>... X |-> I ...</state>
        <declared>... SetItem(X) ...</declared>

    // function call
    syntax KItem ::= stackFrame(K)
    rule <k> X:Id () ~> K => S </k>
        <function> <name> X </name> <body> S </body> </function>
        <fstack> .List => ListItem(stackFrame(K, STATE, D)) ...</fstack>
        <state> STATE => .Map </state>
        <declared> D => .Set </declared>
```
```k
endmodule
```
