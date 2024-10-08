Apart from the existing output, it should also contains anothe branch where the initial `X` is less than 10, so that it would continue to apply the new rule


```
    #Not ( {
      ?X:Int
    #Equals
      0
    } )
  #And
    #Not ( {
      ?Y:Int
    #Equals
      0
    } )
  #And
    #Not ( {
      true
    #Equals
      ?Y:Int >=Int 10
    } )
  #And
    #Not ( {
      true
    #Equals
      ?Y:Int >Int 10
    } )
  #And
    <k>
      ?Y:Int ~> .K
    </k>
  #And
    {
      true
    #Equals
      ?X:Int >Int 10
    }
  #And
    {
      true
    #Equals
      ?Y:Int <Int 10
    }
  #And
    {
      true
    #Equals
      ?Y:Int >Int 0
    }
#Or
    #Not ( {
      ?X:Int
    #Equals
      0
    } )
  #And
    #Not ( {
      true
    #Equals
      ?X:Int >=Int 10
    } )
  #And
    #Not ( {
      true
    #Equals
      ?X:Int >Int 10
    } )
  #And
    <k>
      ?X:Int ~> .K
    </k>
#Or
    #Not ( {
      ?X:Int
    #Equals
      0
    } )
  #And
    <k>
      5 ~> .K
    </k>
  #And
    {
      true
    #Equals
      ?X:Int >=Int 10
    }

```
