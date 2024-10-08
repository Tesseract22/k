Exercise 1.
```
inj{SortBoolean{}, SortKItem{}}(
  Lbl'UndsOr-OR-UndsUnds'LESSON-03-A'Unds'Boolean'Unds'Boolean'Unds'Boolean{}(
    Lblfalse'Unds'LESSON-03-A'Unds'Boolean{}(),
    Lbltrue'Unds'LESSON-03-A'Unds'Boolean{}()
  )
)
```


Exercise 2.
and-or-left.bool:
```
`_||__LESSON-03-D_Boolean_Boolean_Boolean`
(
    `_&&__LESSON-03-D_Boolean_Boolean_Boolean`
        (`true_LESSON-03-D_Boolean`(.KList),
        `false_LESSON-03-D_Boolean`(.KList)),
`false_LESSON-03-D_Boolean`(.KList))

```

and-or-right.bool:
```
`_&&__LESSON-03-D_Boolean_Boolean_Boolean`
(
    `true_LESSON-03-D_Boolean`(.KList),
    `~_||__LESSON-03-D_Boolean_Boolean_Boolean`
        (`false_LESSON-03-D_Boolean`(.KList),`false_LESSON-03-D_Boolean`(.KList)))

```

Exercise 3.

1. AOT: 0.003s; JIT: 0.711s
2. integer.k
3. ambig.int and disambig.int
