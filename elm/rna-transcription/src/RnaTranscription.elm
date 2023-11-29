module RnaTranscription exposing (toRNA)


complement : Char -> Result String Char
complement nucleotide =
    case nucleotide of
        'G' ->
            Ok 'C'

        'C' ->
            Ok 'G'

        'T' ->
            Ok 'A'

        'A' ->
            Ok 'U'

        _ ->
            Err "Invalid nucleotide"


toRNA : String -> Result String String
toRNA =
    String.foldr (\char result -> Result.map2 String.cons (complement char) result) (Ok "")
