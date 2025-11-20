module Darts (score) where

score :: Float -> Float -> Int
score x y
  | x == 0 ||  y == 0 = getScore( area(findOneLine x y))
  | otherwise =  getScore  (area (findPerimeter x y))
  where
  findOneLine :: Float -> Float -> Float  
  findOneLine x y = max (abs x) (abs y) 
  findPerimeter x y = sqrt (x^2 + y^2)
  area r = pi * r *r
  getScore x 
    | x <= area 1 = 10 
    | x <= area 5 = 5 
    | x <= area 10 = 1
    |  otherwise = 0  
  
 