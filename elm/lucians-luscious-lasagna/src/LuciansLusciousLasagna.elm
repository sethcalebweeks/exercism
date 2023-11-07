module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)

-- TODO: define the expectedMinutesInOven constant
expectedMinutesInOven = 40
-- TODO: define the preparationTimeInMinutes function
preparationTimeInMinutes layers = 2 * layers    
-- TODO: define the elapsedTimeInMinutes function
elapsedTimeInMinutes layers timeInOven = timeInOven + preparationTimeInMinutes layers
