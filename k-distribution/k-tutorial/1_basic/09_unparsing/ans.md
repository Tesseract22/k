Exercise 1. 
Original unparse: 
```
<k>
  true && false && ! true ^ ( false || true ) ~> .K
</k>

```

Modifed unparse (lesson-09-a.k)
```
<k>
  true && false && ! true ^ false || true ~> .K
</k>

```

They are different, because with left asssociativity, `true && false && ! true ^  false || true ` is essentially ` (((true && false) && (! true)) ^ false) || true`, which is different from the original program. Therefore, a parenthesis has to be added to the last expression.


Exercise 2.
lesson-09-c.k

Exercise 3.
1. lesson-09-c.k
2. integer-bool.md
