Exercise 1. ex1.k
Exercise 2. integer-bool.md


old:
```
  <functions>
    f |-> int y = 3 ;  y = y + 3 ;  return y ;  .Stmts
    main |-> int x = 2 ;  return x > f ( ) ;  .Stmts
  </functions>

```
new:

```
  <functions>
    <function>
      <name>
        f
      </name>
      <body>
        int y = 3 ;  y = y + 3 ;  return y ;  .Stmts
      </body>
    </function> <function>
      <name>
        main
      </name>
      <body>
        int x = 2 ;  return x > f ( ) ;  .Stmts
      </body>
    </function>
  </functions>

```
