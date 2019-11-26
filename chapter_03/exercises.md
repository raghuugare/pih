# Chapter 03

## Exercises


### 1 What are the types of the following values?

```haskell
['a', 'b', 'c']
```

```haskell
[Char] -- a list of Char's
```

---

```haskell
('a', 'b', 'c')
```

```haskell
(Char, Char, Char) -- a tuple of Char's
```

---

```haskell
[(False, 'O'), (True '1')]
```

```haskell
[(Bool, Char)] -- a list of tuples/pairs of the form (Bool, Char)
```

---

```haskell
([False, True], ['0', '1'])
```

```haskell
([Bool],[Char]) -- a tuple/pair whose 1st element is a list of Bool's and the 2nd element is a list of Char's
```

---

```haskell
[tail, init, reverse]
```

```haskell
[[a]->[a]] -- a list of function-types that are of the type [a]->[a] for a type-variable 'a'
```

---

### 2 What are the types of the following functions?

_Hint_: Take care to include the necessary class constraints if the functions are defined using overloaded operators.

```haskell
second xs = head (tail xs)
```

```haskell
second :: [a] -> a
```

---

```haskell
swap (x, y) = (y, x)
```

```haskell
swap :: (a, b) -> (b, a)
```

---

```haskell
pair x y = (x, y)
```

```haskell
pair :: a -> b -> (a, b)
```

---

```haskell
double x = x * 2
```

```haskell
double :: Num a => a -> a
```

---

```haskell 
palindrome xs = reverse xs == xs
```

```haskell
palindrome :: Eq a => [a] -> Bool
```

---

```haskell
twice f x = f (f x)
```

```haskell
twice :: (a -> a) -> a -> a 
```

---

### 3 Check your answers using GHCi

Done!
