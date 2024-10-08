In this module, we are using Int and Bool
```k
module INTEGER

    imports INT
    imports INT-SYNTAX
    imports BOOL
    imports BOOL-SYNTAX
```
This is the syntax for our language. It supports addition, subtraction, muliplication, and division. It also supports a unary operator `-`.

```k
    syntax Exp	::= 	Int [group(literal)]
		|	"(" Exp ")" [bracket, group(atom), color(Red)]
		|	"-" Exp [group(neg), function, color(Blue)]
		|	Exp "/" Exp [group(mul), function, color(Blue)]
		|	Exp "*" Exp [group(mul), function, color(Blue)]
		|	Exp "+" Exp [group(add), function, color(Blue)]
		|	Exp "-" Exp [group(add), function, color(Blue)]
    syntax Eval ::= eval(Exp) [function]
```
To disambiguate the grammar, we define priority and associativity. As usual, negtaion binds the tightest, and then mulplication/division, and then addition/subtraction.
```k
    syntax priority literal atom > neg > mul > add
    syntax left mul
    syntax left add

```
Here is the semantics for this languge
```k
    rule eval(I: Int) => I
    rule eval(- E) => 0 -Int {eval(E)}:>Int
    rule eval(A + B) => {eval(A)}:>INt +Int {eval(B)}:>Int
    rule eval(A - B) => {eval(A)}:>INt -Int {eval(B)}:>Int
    rule eval(A * B) => {eval(A)}:>INt *Int {eval(B)}:>Int
    rule eval(A / B) => {eval(A)}:>INt /Int {eval(B)}:>Int

```

```k
endmodule
```
