module Main where
  import Data.List
-- • Write a function that looks up a hash table value that uses the Maybe monad. Write a hash that stores other hashes, several levels deep. Use the Maybe monad to retrieve an element for a hash key several levels deep.
  try :: Eq a => a -> [(a, b)] -> Maybe b
  try _ [] = Nothing
  try key ((k, v):t)
    | key == k = Just v
    | otherwise = try key t

-- • Represent a maze in Haskell. You’ll need a Maze type and a Node type, as well as a function to return a node given its coordinates. The node should have a list of exits to other nodes.
  type Position = (Int, Int)
  type Node = (Position, [Position])
  type Maze = [Node]
  locate position maze = find (\(pos, _) -> pos == position) maze
