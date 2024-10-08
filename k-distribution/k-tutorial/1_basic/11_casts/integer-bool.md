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
    syntax Exp	::= 	Int [group(literal)]
        |   Bool [group(literal)]
		|	"(" Exp ")" [bracket, group(atom)]
		|	"-" Exp [group(neg)]
		|	Exp "/" Exp [group(mul), color(Blue)]
		|	Exp "*" Exp [group(mul), color(Blue)]
		|	Exp "+" Exp [group(add), color(Blue)]
		|	Exp "-" Exp [group(add), color(Blue)]
		|	Exp "<" Exp [group(cmp), color(Green)]
		|	Exp "<=" Exp [group(cmp), color(Green)]	
		|	Exp ">" Exp [group(cmp), color(Green)]	
		|	Exp ">=" Exp [group(cmp), color(Green)]
		|	Exp "==" Exp [group(cmp), color(Green)]	
		|	Exp "!=" Exp [group(cmp), color(Green)]	

    syntax Exp ::= eval(Exp) [function]

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
    rule eval(I:Int) => I
    rule eval(B:Bool) => B
    rule eval(- E) => 0 -Int {eval(E)}:>Int
    rule eval(A + B) => {eval(A)}:>Int +Int {eval(B)}:>Int
    rule eval(A - B) => {eval(A)}:>Int -Int {eval(B)}:>Int
    rule eval(A * B) => {eval(A)}:>Int *Int {eval(B)}:>Int
    rule eval(A / B) => {eval(A)}:>Int /Int {eval(B)}:>Int

    rule eval(A >= B) => {eval(A)}:>Int >=Int {eval(B)}:>Int
    rule eval(A > B ) => {eval(A)}:>Int >Int  {eval(B)}:>Int
    rule eval(A < B ) => {eval(A)}:>Int <Int  {eval(B)}:>Int
    rule eval(A <= B) => {eval(A)}:>Int <=Int {eval(B)}:>Int
    rule eval(A == B) => {eval(A)}:>Int ==Int {eval(B)}:>Int
    rule eval(A != B) => {eval(A)}:>Int =/=Int {eval(B)}:>Int

```

```k
endmodule
```
