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
  data Node = Node Position [Position] deriving Show
  type Maze = [Node]
  locate :: Maze -> Position -> Maybe Node
  locate maze position = find (\(Node pos _) -> pos == position) maze

-- • Use a List monad to solve the maze.
  exits Nothing = []
  exits (Just (Node _ exits)) = exits

  solve :: Maze -> Position -> Position -> Maybe [Position]
  solve maze start exit =
    case tryMoves [start] of
      [] -> Nothing
      [path] -> Just(reverse path)
    where
      tryMoves path@(pos:_)
        | pos == exit = return path
        | otherwise = do
            exit <- (exits(locate maze pos)) \\ path
            tryMoves (exit:path)

-- let maze = [(Node (0, 0) [(0, 1)]), (Node (0, 1) [(0, 0), (1, 1)]),
--             (Node (1, 0) []), (Node (1, 1) [(0, 1)])]
-- solve maze (0, 0) (1, 1)
--   Just [(0,0),(0,1),(1,1)]
-- solve maze (0, 0) (1, 0)
--   Nothing
