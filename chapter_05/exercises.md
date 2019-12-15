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