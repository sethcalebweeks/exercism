module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } = Maybe.withDefault "Mighty Magician" name


revive : Player -> Maybe Player
revive player =
    if player.health == 0 then
        if player.level >= 10 then
            Just { player | health = 100, mana = Just 100 }

        else
            Just { player | health = 100, mana = Nothing }

    else
        Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Just mana ->
            if mana >= manaCost then
                ( { player | mana = Just (mana - manaCost) }, 2 * manaCost )

            else
                ( player, 0 )

        Nothing ->
            ( { player | health = max (player.health - manaCost) 0 }, 0 )
