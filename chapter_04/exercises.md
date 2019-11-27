# Chapter 04

1. Using library functions, define a function `halve :: [ a ] → ([ a ], [ a ])` that splits an even-lengthed list into two halves. For example:
> `halve [1,2,3,4,5,6]` should give  `([1, 2, 3], [4, 5, 6])`

```haskell

halve :: [a] -> ([a], [a])
halve xs = (take (length xs `div` 2) xs , drop (length xs `div` 2) xs )

```

---

2. Consider a function `safetail :: [ a ] → [ a ]` that behaves as the library function `tail`, except that `safetail` maps the empty list to itself, whereas `tail` produces an error in this case. Define `safetail` using:
(a) a conditional expression; 
(b) guarded equations;
(c) pattern matching.

Hint: Make use of the library function `null`

```haskell

-- Using a conditional expression.
safetail1 :: [a] -> [a]
safetail1 xs = if null xs then [] else tail xs

-- Using guarded equations
safetail2 :: [a] -> [a]
safetail2 xs | null xs   = []
             | otherwise = tail xs

-- Using pattern-matching
safetail3 :: [a] -> [a]
safetail3 []     = []
safetail3 (x:xs) = xs

```
