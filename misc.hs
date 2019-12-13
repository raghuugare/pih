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


data Name = N String

data Person = P Name Int deriving Show

name :: Person -> String
name (P (N n) a) = n

age :: Person -> Int
age (P (N n) a) = a

instance Eq Name where
    N a1 == N a2 = a1 == a2

instance Ord Name where
    compare (N n1) (N n2) = compare n1 n2
    (N n1) <= (N n2) = n1 <= n2

instance Show Name where
    show (N n) = show n
    
instance Eq Person where
    (P n1 a1) == (P n2 a2) = n1 == n2
    
instance Ord Person where
    compare (P n1 a1) (P n2 a2) = compare n1 n2
    (P n1 a1) <= (P n2 a2) = n1 <= n2


-- type Name = String

main :: IO()
main = putStrLn "Hello!"