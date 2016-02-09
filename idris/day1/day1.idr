-- Find the numbers in a list that are greater than a given number.
greater : Int -> List Int -> List Int
greater number list = filter (> number) list

-- Create data types representing even and odd numbers such that:
-- – The successor to an even number is an odd number, and
-- – The successor to an odd number is an even number.
data EvenOdd = Even Nat | Odd Nat

succ : EvenOdd -> EvenOdd
succ (Even n) = Odd (S n)
succ (Odd n)  = Even (S n)

-- Build a parameterized data type representing a binary tree.
data BinaryTree a = Leaf a | Node (BinaryTree a) (BinaryTree a)

-- Reverse the elements of a list. (Hint: You may need some helper functions.)
reverse : List a -> List a
reverse = reverse' []
  where
    reverse' : List a -> List a -> List a
    reverse' acc []      = acc
    reverse' acc (x::xs) = reverse' (x::acc) xs
