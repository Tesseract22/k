1. Running `fun main() { return 0; }`, both backend behaves the same
2. Running `fun.int`, the llvm backend outputs 
```
<T>
  <k>
    38 ~> .K
  </k>
  <state>
    .Map
  </state>
  <declared>
    .Set
  </declared>
  <functions>
    f |-> int y = 3 ;  y = y + 3 ;  if y == 6 { return y * y ;  .Stmts }  return y ;  .Stmts
    main |-> int x = 2 ;  return x + f ( ) ;  .Stmts
  </functions>
  <fdeclared>
    SetItem ( f )
    SetItem ( main )
  </fdeclared>
  <fstack>
    .List
  </fstack>
</T>
```
, whereas the haskell backend just hang.


After some investigation, it seems like it is stuck on `y = y + 3;`. After removing this line, it outputs: 
```
  <T>
    <k>
      5 ~> .K
    </k>
    <state>
      .Map
    </state>
    <declared>
      .Set
    </declared>
    <functions>
      f |-> int y = 3 ;  if y == 6 { return y * y ;  .Stmts }  return y ;  .Stmts
      main |-> int x = 2 ;  return x + f ( ) ;  .Stmts
    </functions>
    <fdeclared>
      SetItem ( f )
      SetItem ( main )
    </fdeclared>
    <fstack>
      .List
    </fstack>
  </T>
#Or
  <T>
    <k>
      x ~> #freezer_+__INTEGER-BOOL_Exp_Exp_Exp0_ ( f ( ) ~> .K ) ~> .K
    </k>
    <state>
      .Map
    </state>
    <declared>
      .Set
    </declared>
    <functions>
      f |-> int y = 3 ;  if y == 6 { return y * y ;  .Stmts }  return y ;  .Stmts
      main |-> int x = 2 ;  return x + f ( ) ;  .Stmts
    </functions>
    <fdeclared>
      SetItem ( f )
      SetItem ( main )
    </fdeclared>
    <fstack>
      .List
    </fstack>
  </T>
#Or
  <T>
    <k>
      y ~> #freezer_+__INTEGER-BOOL_Exp_Exp_Exp1_ ( 2 ~> .K ) ~> #freezerreturn_;_INTEGER-BOOL_Stmt_Exp0_ ( ) ~> .Stmts ~> .K
    </k>
    <state>
      x |-> 2
    </state>
    <declared>
      SetItem ( x )
    </declared>
    <functions>
      f |-> int y = 3 ;  if y == 6 { return y * y ;  .Stmts }  return y ;  .Stmts
      main |-> int x = 2 ;  return x + f ( ) ;  .Stmts
    </functions>
    <fdeclared>
      SetItem ( f )
      SetItem ( main )
    </fdeclared>
    <fstack>
      ListItem ( stackFrame ( .K , .Map , .Set ) )
    </fstack>
  </T>
```

