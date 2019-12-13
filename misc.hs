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