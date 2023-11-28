module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)

import Regex


clean1 : String -> String
clean1 =
    String.replace " " "_"


clean2 : String -> String
clean2 =
    clean1 >> String.replace "\n" "[CTRL]" >> String.replace "\t" "[CTRL]" >> String.replace "\u{000D}" "[CTRL]"


clean3 : String -> String
clean3 =
    let
        regex =
            Maybe.withDefault Regex.never (Regex.fromString "-(.)")

        replace =
            \match -> String.toUpper match.match
    in
    clean2 >> Regex.replace regex replace >> String.replace "-" ""


clean4 : String -> String
clean4 =
    clean3 >> String.filter (not << Char.isDigit)


clean : String -> String
clean =
    clean4 >> String.filter (\char -> not (List.member char (charRange 'α' 'ω')))


charRange : Char -> Char -> List Char
charRange from to =
    List.map Char.fromCode <| List.range (Char.toCode from) (Char.toCode to)
