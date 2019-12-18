module Caesar where

import Data.Char

myIsUpper :: Char -> Bool
myIsUpper c = ord c >= ord 'A' && ord c <= ord 'Z'

letter2int :: Char -> Int
letter2int c = ord c - ord 'a'

int2letter :: Int -> Char
int2letter n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2letter ((letter2int c + n) `mod` 26)
          | otherwise = c  