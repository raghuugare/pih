module Caesar where

import Data.Char

risUpper :: Char -> Bool
risUpper c = ord c >= ord 'A' && ord c <= ord 'Z'

letter2int :: Char -> Int
letter2int c = ord c - ord 'a'

int2letter :: Int -> Char
int2letter n = chr (ord 'a' + n)

