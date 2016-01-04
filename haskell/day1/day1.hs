module Main where
-- • How many different ways can you find to write allEven?
  allEvenComprehension :: [Integer] -> [Integer]
  allEvenComprehension list = [x | x <- list, even x]

  allEvenFilter :: [Integer] -> [Integer]
  allEvenFilter list = filter even list

-- • Write a function that takes a list and returns the same list in reverse.
  reverseList [] = []
  reverseList (h:t) = reverseList(t) ++ [h]

-- • Write a function that builds two-tuples with all possible combinations of two of the colors black, white, blue, yellow, and red. Note that you should include only one of (black, blue) and (blue, black).
  colorCombinations = do
    let colors = ["black", "white", "yellow", "red"]
    [(a, b) | a <- colors, b <- colors, a <= b]

-- • Write a list comprehension to build a childhood multiplication table. The table would be a list of three-tuples where the first two are integers from 1–12 and the third is the product of the first two.
  multiplicationTable = [(a, b, a * b) | a <- [1..12], b <- [1..12] ]

-- • Solve the map-coloring problem (Map Coloring,on page 101) using Haskell.
  mapColoring = do
    let colors = ["red", "green", "blue"]
    [("Alabama", a, "Mississippi", m, "Georgia", g, "Tennessee", t, "Florida", f) |
      a <- colors, m <- colors, g <- colors, t <- colors, f <- colors,
      m /= t, m /= a, a /= t, a /= m, a /= g, a /= f, g /= f, g /= t ]
