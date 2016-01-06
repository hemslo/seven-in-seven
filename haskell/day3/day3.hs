module Main where
-- • Write a function that looks up a hash table value that uses the Maybe monad. Write a hash that stores other hashes, several levels deep. Use the Maybe monad to retrieve an element for a hash key several levels deep.
  try :: Eq a => a -> [(a, b)] -> Maybe b
  try _ [] = Nothing
  try key ((k, v):t)
    | key == k = Just v
    | otherwise = try key t
