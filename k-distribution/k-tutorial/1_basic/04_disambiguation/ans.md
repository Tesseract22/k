Exercise 1.
The ouput from the original program is 

```
`_||__LESSON-04-A_Boolean_Boolean_Boolean`(`
    _&&__LESSON-04-A_Boolean_Boolean_Boolean`(
        `true_LESSON-04-A_Boolean`(.KList),
        `false_LESSON-04-A_Boolean`(.KList)
    ),
    `false_LESSON-04-A_Boolean`(.KList))

```

As you can see `||` is being placed on the toplevel.


```
`_&&__LESSON-04-A-ANS_Boolean_Boolean_Boolean`(
    `true_LESSON-04-A-ANS_Boolean`(.KList),`
	    _||__LESSON-04-A-ANS_Boolean_Boolean_Boolean`(
            `false_LESSON-04-A-ANS_Boolean`(.KList),
            `false_LESSON-04-A-ANS_Boolean`(.KList)))

```

With the modified version (lesson-04-a-ans.k), `&&` is not at the toplevel.

Exercse 2.

orignal output:

```
`_&&__LESSON-04-C_Boolean_Boolean_Boolean`
    (`_&&__LESSON-04-C_Boolean_Boolean_Boolean`
        (`true_LESSON-04-C_Boolean`(.KList),
        `false_LESSON-04-C_Boolean`(.KList)),
    `false_LESSON-04-C_Boolean`(.KList))

```
We can see that `true && false` is placed lower down the ast.
With the modifed version (lesson-04-c-ans.k), `false && false` is placed lower down the ast.
```
`_&&__LESSON-04-C-ANS_Boolean_Boolean_Boolean`(
    `true_LESSON-04-C-ANS_Boolean`(.KList),
    `_&&__LESSON-04-C-ANS_Boolean_Boolean_Boolean`(
        `false_LESSON-04-C-ANS_Boolean`(.KList),
        `false_LESSON-04-C-ANS_Boolean`(.KList)))

```

Exercse 3.
1. 
Original output:
```
`if(_)__LESSON-04-F_Stmt_Exp_Stmt`(
    `true_LESSON-04-F_Exp`(.KList),
    `if(_)_else__LESSON-04-F_Stmt_Exp_Stmt_Stmt`(
        `false_LESSON-04-F_Exp`(.KList),
        `{}_LESSON-04-F_Stmt`(.KList),
        `{}_LESSON-04-F_Stmt`(.KList)))

```
As we can see, the else clause binds with the second if.
With the modifed version (lesson-04-k-ans.k), the else clause binds with the first if.
```
`if(_)_else__LESSON-04-F-ANS_Stmt_Exp_Stmt_Stmt`(
    `true_LESSON-04-F-ANS_Exp`(.KList),
    `if(_)__LESSON-04-F-ANS_Stmt_Exp_Stmt`(
        `false_LESSON-04-F-ANS_Exp`(.KList),`{}_LESSON-04-F-ANS_Stmt`(.KList)),
    `{}_LESSON-04-F-ANS_Stmt`(.KList))

```
2. integer.k and integer-inline.k
3. ambig.k and disambig.k
4. "Specifically, it applies in cases where the child is either the first or last production item in the parent's production"
