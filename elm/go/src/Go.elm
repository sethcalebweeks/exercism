module Go exposing (..)

import GoSupport exposing (..)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    let
        rulesApplied =
            oneStonePerPointRule game
                |> Result.map captureRule
                |> Result.andThen libertyRule
                |> Result.andThen koRule
    in
    case rulesApplied of
        Ok updatedGame ->
            changePlayer updatedGame

        Err error ->
            { game | error = error }
