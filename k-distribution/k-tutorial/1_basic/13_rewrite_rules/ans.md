Exercise 1.
lesson-11-e.k
Running on a empty program ouputs: 
```
[Error] Inner Parser: Parse error: unexpected end of file.
	Source(/tmp/.krun-2024-10-08-00-57-47-3z8rCoEwFL/tmp.PGM.pretty.3Ff52lWbUk)
	Location(1,1,1,1)
```
This is because the parse expects `Exp` at toplevel, but `Exp` cannot be an empty string

After adding two rules, and with `--search`
```
  {
    Result:GeneratedTopCell
  #Equals
    <k>
      0 ~> .K
    </k>
  }
#Or
  {
    Result:GeneratedTopCell
  #Equals
    <k>
      false ~> .K
    </k>
  }

```
After adding a thrid rule:
```
  {
    Result:GeneratedTopCell
  #Equals
    <k>
      1 ~> .K
    </k>
  }
#Or
  {
    Result:GeneratedTopCell
  #Equals
    <k>
      true ~> .K
    </k>
  }

```
Exercise 2.
lesson-13-b.k
`-cPGM="1 + 2 - 3"`

`--depth 1`
```
<k>
  1 + 2 ~> freezer6 ( 3 ) ~> .K
</k>
```
`--depth 2`
```
<k>
  3 ~> freezer6 ( 3 ) ~> .K
</k>
```
`--depth 3`
```
<k>
  3 - 3 ~> .K
</k>

```
`--depth 4`
```
<k>
  0 ~> .K
</k>
```
Exercise 3. lesson-13-c.k
