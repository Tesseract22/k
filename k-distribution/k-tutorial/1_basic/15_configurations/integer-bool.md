In this module, we are using Int and Bool
```k
module INTEGER-BOOL

    imports INT
    imports INT-SYNTAX
    imports BOOL
    imports BOOL-SYNTAX
```
This is the syntax for our language. It supports addition, subtraction, muliplication, and division. It also supports a unary operator `-`.
On top of that, we also have relational operator for integer.
```k
configuration   <T>
                    <k> $PGM:Stmt </k>
                    <wrap> <div> false </div> </wrap>
                </T>
``` 
```k
    syntax Exp	::= 	Int [group(literal)]
        |   Bool [group(literal)]
		|	"(" Exp ")" [bracket, group(atom)]
		|	"-" Exp [group(neg), function]
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


    syntax Stmt ::= Bool ";" Exp
                |   "reset" ";" Exp
                |   Exp


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
    rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k> <div> true </div> requires I2 =/=Int 0
    rule <k> I1:Int / I2:Int => I1 divInt I2 ...</k> <div> false </div> requires I2 =/=Int 0



    rule <k> I1:Int >= I2:Int => I1 >=Int I2 ...</k>
    rule <k> I1:Int <= I2:Int => I1 <=Int I2 ...</k>
    rule <k> I1:Int < I2:Int => I1 <Int I2 ...</k>
    rule <k> I1:Int > I2:Int => I1 >Int I2 ...</k>
    rule <k> I1:Int == I2:Int => I1 ==Int I2 ...</k>
    rule <k> I1:Int != I2:Int => I1 =/=Int I2 ...</k>

    rule <k> B:Bool ; E:Exp => E ... </k> <div> _ => B </div> 
    rule <k> reset ; E:Exp => E ... </k> <wrap> ... .Bag ... </wrap>

```
```k
endmodule
```
