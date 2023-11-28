module PhoneNumber exposing (getNumber)

import String as S


getNumber : String -> Maybe String
getNumber =
    sanitizeNumber >> validateNumber


sanitizeNumber : String -> String
sanitizeNumber phoneNumber =
    let
        stripped =
            String.filter Char.isDigit phoneNumber
    in
    if S.length stripped == 11 && S.startsWith "1" stripped then
        S.right 10 stripped

    else
        stripped


validateNumber : String -> Maybe String
validateNumber phoneNumber =
    if S.length phoneNumber /= 10 then
        Nothing

    else if (S.slice 0 1 phoneNumber |> S.toInt |> Maybe.withDefault 0) < 2 then
        Nothing

    else if (S.slice 3 4 phoneNumber |> S.toInt |> Maybe.withDefault 0) < 2 then
        Nothing

    else
        Just phoneNumber
