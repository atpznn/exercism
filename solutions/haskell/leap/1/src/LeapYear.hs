module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year 
  | year `mod` 4 == 0 = if year `mod` 100 ==0 then year `mod` 400 == 0  else True
  | otherwise = False