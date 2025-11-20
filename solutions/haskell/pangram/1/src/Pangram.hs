module Pangram (isPangram) where

import Data.Char (toLower)

letters = ['a'..'z']
isPangram :: String -> Bool
isPangram text = length [d|d<- letters, found d text]  == length letters
    where
        found x [] = False
        found x (y:ys)
            | toLower  x ==  toLower y = True 
            | otherwise = found x ys