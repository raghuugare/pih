double :: Int -> Int
double x = x + x

quadruple :: Int -> Int
quadruple x = double (double x)

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

factorial :: Int -> Int
factorial' 0 = 1
factorial' n = product [1..n]
