module ScrabbleScore exposing (scoreWord)


letterValues : List ( List Char, Int )
letterValues =
    [ ( [ 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ], 1 )
    , ( [ 'D', 'G' ], 2 )
    , ( [ 'B', 'C', 'M', 'P' ], 3 )
    , ( [ 'F', 'H', 'V', 'W', 'Y' ], 4 )
    , ( [ 'K' ], 5 )
    , ( [ 'J', 'X' ], 8 )
    , ( [ 'Q', 'Z' ], 10 )
    ]


letterValue : Char -> Int
letterValue letter =
    List.filter (\pair -> List.member (Char.toUpper letter) (Tuple.first pair)) letterValues
        |> List.head
        |> Maybe.withDefault ( [], 0 )
        |> Tuple.second


scoreWord : String -> Int
scoreWord =
    String.foldr (\letter score -> score + letterValue letter) 0
