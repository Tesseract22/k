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
        |   Bool
		|	"(" Exp ")" [bracket, group(atom)]
		|	"-" Exp [group(neg), function]
		|	Exp "/" Exp [group(mul), function]
		|	Exp "*" Exp [group(mul), function]
		|	Exp "+" Exp [group(add), function]
		|	Exp "-" Exp [group(add), function]
		|	Exp "<" Exp  [group(cmp), function]	
		|	Exp "<=" Exp [group(cmp), function]	
		|	Exp ">" Exp  [group(cmp), function]	
		|	Exp ">=" Exp [group(cmp), function]
		|	Exp "==" Exp [group(cmp), function]	
		|	Exp "!=" Exp [group(cmp), function]	


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
    rule - A => 0 -Int A
    rule A + B => A +Int B 
    rule A - B => A -Int B 
    rule A * B => A *Int B 
    rule A / B => A /Int B requires B =/=Int 0

    rule A >= B => A >=Int B
    rule A > B => A >Int B
    rule A < B => A <Int B
    rule A <= B => A <=Int B
    rule A == B => A ==Int B
    rule A != B => notBool (A ==Int B)

```

```k
endmodule
```
