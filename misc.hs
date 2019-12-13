insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert z (x:xs) | z <= x    = z : insert x xs
                | otherwise = x : insert z xs

insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort (x:xs) = insert x $ insertionSort xs

a = [(x,y) | x <- [1,2,3], y <- [4,5,6]]
b = concat [ [(x,y) | x <- [1..3]] | y <- [4,5,6]]

-- insertionSort a == insertionSort b
-- True :-) 

scalarProduct :: Num a => [a] -> [a] -> a
scalarProduct xs ys = sum [x*y | (x,y) <- pairs]
                        where pairs = zip xs ys

data B = F | T deriving (Eq, Ord, Show, Read)

isEven :: Int -> B
isEven n = if n `mod` 2 == 0 then T else F


data Person = P String Int deriving (Show, Read)

name :: Person -> String
name (P n a) = n

age :: Person -> Int
age (P n a) = a

instance Eq Person where
    (P n1 a1) == (P n2 a2) = n1 == n2

instance Ord Person where
    compare (P n1 a1) (P n2 a2) = compare n1 n2
    (P n1 a1) <= (P n2 a2) = n1 <= n2


main :: IO()
main = putStrLn "Hello!"