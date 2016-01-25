defmodule Day1 do
# Express some geometry objects using tuples: a two-dimensional point, a line, a circle, a polygon, and a triangle.
  point = {1, 2}
  line = {{1, 2}, {1, 3}}
  circle = {{1, 1}, 1 }
  polygon = {{1, 2}, {1, 3}, {2, 3}, {2, 2}}
  triangle = {{1, 2}, {3, 2}, {2, 3}}

# Write a function to compute the hypotenuse of a right triangle given the length of two sides.
  def hypotenuse(a, b), do: (a * a + b * b) |> :math.sqrt

# Convert a string to an atom.
  IO.inspect String.to_atom("string")

# Test to see if an expression is an atom.
  IO.inspect is_atom(1 > 2)

# Given a list of numbers, use recursion to find (1) the size of the list, (2) the maximum value, and (3) the minimum value.
  def list_size([]), do: 0
  def list_size([_|tail]), do: 1 + list_size(tail)

  def list_max([], curr), do: curr
  def list_max([head|tail], curr), do: list_max(tail, (if head > curr, do: head, else: curr))
  def list_max([head|tail]), do: list_max(tail, head)

  def list_min([], curr), do: curr
  def list_min([head|tail], curr), do: list_min(tail, (if head < curr, do: head, else: curr))
  def list_min([head|tail]), do: list_min(tail, head)

# Given a list of atoms, build a function called word_count that returns a keyword list, where the keys are atoms from the list and the values are the number of occurrences of that word in the list. For example, word_count([:one, :two, :two]) returns [one: 1, two: 2].
  def word_count(atoms) do
    Enum.reduce(atoms, [], &(Keyword.put(&2, &1, 1 + Keyword.get(&2, &1, 0))))
  end

#  Represent a tree of sentences as tuples. Traverse the tree, presenting an indented list. For example, traverse({"See Spot.", {"See Spot sit.", "See Spot run."}}) would return:
# See Spot.
#   See Spot sit.
#   See Spot run.
  def traverse(tree) do
    _traverse(Tuple.to_list(tree), 0)
  end

  def _traverse(tree=[_|_], level) do
    Enum.each(tree, &(_traverse((if is_tuple(&1), do: Tuple.to_list(&1), else: &1), level + 1)))
  end

  def _traverse(node, level) do
    IO.puts "#{String.duplicate(" ", level * 2 - 2)}#{node}"
  end
end
