module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers minutesSinceStarting =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes numLayers =
            numLayers * 2
    in
    expectedMinutesInOven + preparationTimeInMinutes layers - minutesSinceStarting
