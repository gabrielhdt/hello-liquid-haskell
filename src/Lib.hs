module Lib where

{-@ lowerThan :: n: Integer -> { m : Integer | m == n } @-}
lowerThan :: Integer -> Integer
lowerThan x = x
