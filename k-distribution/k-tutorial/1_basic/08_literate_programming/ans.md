Exercise 1. Result of compiling and running `krun plus.math`
```
<k>
  3 ~> .K
</k>
```

Exercise 2. `krun -cPGM="foo(0)"` evaluates to
```
<k>
  0 ~> .K
</k>
```

Exercise 3.
1. Error message:
```
[Error] Compiler: Could not find main module with name README in definition.
Use --main-module to specify one.
```

2. Original error message:

```
[Error] Outer Parser: Encountered "syntax".
Was expecting one of: [<EOF>, "module"]
	Source(/home/cat/coding/k/k/k-distribution/k-tutorial/1_basic/08_literate_programming/lesson-03.md)
	Location(287,1,287,7)
	287 |	syntax Int ::= r"[\\+\\-]?[0-9]+" [token]

```
Line 287 contains a sentence outside a module, therefore it cannot be compiled. By adding `--md-selector k & (! exclude)`, it compiles

3. integer-bool.md
