module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
            deriving(Eq)


oneYearOnEarthInDays = 365.25
oneYearOnEarthInSeconds = 31557600

roundTwoDecimals :: Float -> Float
roundTwoDecimals x = fromIntegral (round (x * 100.0)) / 100.0
ageOn :: Planet -> Float -> Float
ageOn planet seconds = roundTwoDecimals(seconds / (exchangeRate planet  * oneYearOnEarthInDays))
    where 
        exchangeRate planet
            |  planet == Mercury = exchangeRate Earth * 0.2408467
            |  planet == Venus = exchangeRate Earth * 0.61519726 
            |  planet == Earth = oneYearOnEarthInSeconds / oneYearOnEarthInDays
            |  planet == Mars = exchangeRate Earth * 1.8808158
            |  planet == Jupiter = exchangeRate Earth * 11.862615
            |  planet == Saturn = exchangeRate Earth * 29.447498
            |  planet == Uranus= exchangeRate Earth * 84.016846
            |  planet == Neptune = exchangeRate Earth *  164.79132 
            | otherwise = seconds