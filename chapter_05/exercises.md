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

5. A 3-tuple of positive integers of the form `(x, y, z)` is _Pythagorean_ if `x^2 + y^2 = z^2`. Using a list comprehension with 3 generators, define a function `pyths :: Int -> [(Int, Int, Int)]` that returns the list of all such triples whose components are at most a given limit. For example:

```shell
> pyths 10 
[(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10))] 
```

Ans. Use 3 generators and a filter. Also try and eliminate duplicates in the generators itself!

```haskell
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z)| x <- [1..n], y <- [x..n], z <- [y..n], x*x + y*y == z*z]
```