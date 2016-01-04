module Main where
-- • Write a sort that takes a list and returns a sorted list.
  qsort :: Ord a => [a] -> [a]
  qsort [] = []
  qsort (p:xs) = (qsort [x | x <- xs, x < p]) ++ [p] ++ (qsort [x | x <- xs, x >= p])

-- • Write a sort that takes a list and a function that compares its two argu- ments and then returns a sorted list.
  qsortBy :: (a -> a -> Ordering) -> [a] -> [a]
  qsortBy _ [] = []
  qsortBy f (p:xs) = (qsortBy f [x | x <- xs, f x p == LT]) ++ [p] ++ (qsortBy f [x | x <- xs, f x p /= LT])

-- • Write a Haskell function to convert a string to a number. The string should be in the form of $2,345,678.99 and can possibly have leading zeros.
  str2num :: String -> Float
  str2num (_:str) = read (filter (/= ',') str)::Float

-- • Write a function that takes an argument x and returns a lazy sequence that has every third number, starting with x. Then, write a function that includes every fifth number, beginning with y. Combine these functions through composition to return every eighth number, beginning with x + y.
  third x = [x, (x + 3) ..]
  fifth x = [x, (x + 5) ..]
  eighth x y = zipWith (+) (third x) (fifth y)

-- • Use a partially applied function to define a function that will return half of a number and another that will append \n to the end of any string.
  half = (/ 2)
  newline = (++ "\n")

-- • Write a function to determine the greatest common denominator of two integers.
  gcd2 :: Integral a => a -> a -> a
  gcd2 a 0 = a
  gcd2 a b = gcd2 b (a `mod` b)

-- • Create a lazy sequence of prime numbers.
  primes = sieve [2..]
  sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]

-- • Break a long string into individual lines at proper word boundaries.
-- • Add line numbers to the previous exercise.
-- • To the above exercise, add functions to left, right, and fully justify the text with spaces (making both margins straight).
