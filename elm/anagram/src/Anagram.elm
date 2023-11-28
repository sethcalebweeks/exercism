module Anagram exposing (detect)

import Dict exposing (Dict)


detect : String -> List String -> List String
detect word candidates =
    let
        wordCounts =
            letterCounts word

        filter =
            \candidate -> letterCounts candidate == wordCounts && String.toLower word /= String.toLower candidate
    in
    List.filter filter candidates


letterCounts : String -> Dict Char Int
letterCounts =
    String.foldr updateDict Dict.empty


updateDict : Char -> Dict Char Int -> Dict Char Int
updateDict char dict =
    Dict.update (Char.toLower char)
        (\key ->
            case key of
                Just count ->
                    Just (count + 1)

                Nothing ->
                    Just 1
        )
        dict
