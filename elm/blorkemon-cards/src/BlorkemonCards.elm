module BlorkemonCards exposing
    ( Card
    , compareShinyPower
    , expectedWinner
    , isMorePowerful
    , maxPower
    , sortByCoolness
    , sortByMonsterName
    )


type alias Card =
    { monster : String, power : Int, shiny : Bool }


isMorePowerful : Card -> Card -> Bool
isMorePowerful card1 card2 =
    card1.power > card2.power


maxPower : Card -> Card -> Int
maxPower card1 card2 =
    max card1.power card2.power


sortByMonsterName : List Card -> List Card
sortByMonsterName =
    List.sortBy .monster


sortByCoolness : List Card -> List Card
sortByCoolness =
    List.sortWith isCooler


isCooler : Card -> Card -> Order
isCooler card1 card2 =
    case ( card2.shiny, card1.shiny ) of
        ( True, False ) ->
            GT

        ( False, True ) ->
            LT

        _ ->
            compare card2.power card1.power


compareShinyPower : Card -> Card -> Order
compareShinyPower card1 card2 =
    if isMorePowerful card1 card2 then
        GT

    else if isMorePowerful card2 card1 then
        LT

    else
        case ( card1.shiny, card2.shiny ) of
            ( True, False ) ->
                GT

            ( False, True ) ->
                LT

            _ ->
                EQ


expectedWinner : Card -> Card -> String
expectedWinner card1 card2 =
    case compareShinyPower card1 card2 of
        GT ->
            card1.monster

        LT ->
            card2.monster

        EQ ->
            "too close to call"
