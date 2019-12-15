# Chapter 05

1. Using list comprehension, give an expression that calculates the sum 1^2 + 2^2 + 3^2 + ... + 100^2

Ans.

```haskell
sum [x^2 | x <- [1..100]]
```
---

2. Suppose that a _coordinate grid_ of size _m X n_ is given by the list of all pairs _(x,y)_ of integers such that `0 <= x <= m`  and `0 <= y <= n`. Using a list comprehension, define a function `grid :: Int -> Int -> [(Int, Int)]` that returns a coordinate of a given size. For example:

```shell
> grid 1 2
[(0, 0), (0, 1), (1, 1), (1, 2)]
``` 

Ans.

```haskell
grid :: Int -> Int -> [(Int, Int)]
grid p q = [(x,y) | x <- [0, p], y <- [0, q]]
```
---

3. Using a list comprehension and the function `grid` above, define a function `square :: Int -> Int -> [(Int, Int)]` that returns a coordinate square of size `n`, excluding the diagonal from `(0, 0)` to `(n, n)`. For example:  

```shell
> square 2
[(0, 1), (0, 2), (1, 0), (1, 2), (2, 0), (2, 1)]
```

Ans. Use a 'filter' after the generators.

```haskell
square :: Int -> Int -> [(Int, Int)]
square n = [(x, y)| x <- [0..n], y <- [0..n], x /= y ]
```
---

4. In a similar way to the function `length` show how the library function `replicate :: Int -> a -> [a]` that produces a list of identical elements can be defined using a list comprehension. For example: 

```shell
> replicate 3 True
[True, True, True]
```

Ans.

```haskell
-- Using recursion! Straight-forward using guarded equations or pattern-match...
replicate1 :: Int -> a -> [a]
replicate1 n v | n == 0 = []
               | otherwise = v: replicate1 (n-1) v

-- Using List comprehension!
replicate2 :: Int -> a -> [a]
replicate2 n v = [fst (v,y) | y <- take n [1..]]
```
---

5. A 3-tuple of positive integers of the form `(x, y, z)` is _Pythagorean_ if `x^2 + y^2 = z^2`. Using a list comprehension with 3 generators, define a function `pyths :: Int -> [(Int, Int, Int)]` that returns the list of all such triples whose components are at most a given limit. For example:

```shell
> pyths 10 
[(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10))] 
```

Ans. Use 3 generators and a filter.

```haskell
-- Simple solution!
pyths1 :: Int -> [(Int, Int, Int)]
pyths1 n = [(x, y, z)| x <- [1..n]
                     , y <- [1..n]
                     , z <- [1..n]
                     , x*x + y*y == z*z]

-- pyths 6 
-- [(3, 4, 5), (4, 3, 5)]
```

Also try and eliminate duplicates in the generators itself!

```haskell
pyths2 :: Int -> [(Int, Int, Int)]
pyths2 n = [(x, y, z)| x <- [1..n]
                     , y <- [x..n]
                     , z <- [y..n]
                     , x*x + y*y == z*z]
-- pyths2 6 
-- [(3, 4, 5)]
```

Final improvement! Eliminate redundant triples! Consider relatively prime members only!
```haskell
gcd3 :: Integral a => a -> a -> a -> a
gcd3 = gcd a $ gcd b c

-- check if gcd of the tuple members == 1. (Relatively prime!)

```haskell
pyths3 :: Int -> [(Int, Int, Int)]
pyths3 n = [(x, y, z)| x <- [1..n]
                     , y <- [1..n]
                     , z <- [1..n]
                     , x*x + y*y == z*z
                     , gcd3 x y z == 1] 
-- Now,
-- pyths3 20
-- [(3,4,5),(5,12,13),(8,15,17)]
```

---

6. A positive integer is _perfect_ if it equals all its factors, excluding the number itself. Using a list comprehension and the function `factors`, define a function `perfects :: Int -> [Int]` that returns the list of all the perfect numbers upto a given limit. For example: 

```shell
> perfects 500
[6, 28. 496]
```

Ans.

```haskell
factors :: Int -> [Int]
factors n = [x| x <- [1..n], n `mod` x == 0]
```

```haskell
perfects :: Int -> [Int]
perfects n = [x| x <- [1..n], sum (factors x) == 2*x]
```

```haskell
primes :: Int -> [Int]
primes n = [x| x <- [1..n], factors x == [1, x]]
```

---

7. Show how the list comprehension `[(x,y)| x <- [1,2], y <- [3,4]]` with 2 generators can be expressed as 2 list comprehensions with 1 generator each. **Hint** : nest one comprehension within the other & use the library function `concat :: [[a]] -> [a]`

Ans.

```haskell
expr1 :: [(Int, Int)]
expr1 = [(x,y)| x <- [1,2], y <- [3,4]]
-- [(1,3),(1,4),(2,3),(2,4)]
```

Note the difference in order!! :-) 

```haskell
expr2 :: [(Int, Int)]
expr2 = concat [ [(x,y)| x <- [1,2]] | y <-[3,4] ] 
-- [(1,3),(2,3),(1,4),(2,4)]
```
---

8. Redefine the function `positions` using the function `find`.

Ans.

```haskell
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..], x == x' ]
```

The function `find` uses a list comprehension to do a _linear-search_ through an _associative array_. So, we simply use that.

```haskell
find :: Eq a => a -> [(a, b)] -> [b]
find k t = [v| (k', v) <- t, k == k']

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find a $ zip xs [0..]
```
---

9. The _scalar product_ of 2 lists `xs` and `ys` of the same length `n` is given by the sum of the products of the corresponding elements of the 2 lists. Show how a list comprehension can be used to define a function `scalarProduct :: [Int] -> [Int] -> Int` that returns the scalar products of 2 lists. For example:

```shell
> scalarProduct [1,2,3] [4,5,6]
32
```

Ans. Use the `zip` function !! :-) 

```haskell
scalarProduct :: Num a => [a] -> [a] -> a
scalarProduct xs ys = sum [x*y| (x,y) <- zip xs ys]
```

