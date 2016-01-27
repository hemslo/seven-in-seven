# Given an incomplete tic-tac-toe board, compute the next player’s best move.
defmodule TicTacToe do
  def state([a, a, a,
             _, _, _,
             _, _, _]) when a != "_", do: a

  def state([_, _, _,
             a, a, a,
             _, _, _]) when a != "_", do: a

  def state([_, _, _,
             _, _, _,
             a, a, a]) when a != "_", do: a

  def state([a, _, _,
             a, _, _,
             a, _, _]) when a != "_", do: a

  def state([_, a, _,
             _, a, _,
             _, a, _]) when a != "_", do: a

  def state([_, _, a,
             _, _, a,
             _, _, a]) when a != "_", do: a

  def state([a, _, _,
             _, a, _,
             _, _, a]) when a != "_", do: a

  def state([_, _, a,
             _, a, _,
             a, _, _]) when a != "_", do: a

  def state(board) do
    if Enum.any?(board, &(&1 == "_")), do: :incomplete, else: :draw
  end

  def value(:draw, _), do: 0

  def value(state, player), do: if state == player, do: 1, else: -1

  def current_player(board) do
    Enum.min_by ["X", "O"], fn(x) -> Enum.count(board, &(&1 == x)) end
  end

  def next_moves(board) do
    Enum.filter_map Enum.with_index(board),
                    fn({e, _}) -> e == "_" end,
                    fn({_, i}) -> i end
  end

  def next_board(board, move) do
    List.update_at(board, move, fn(_) -> current_player(board) end)
  end

  def next_boards(board) do
    Enum.map next_moves(board), &(next_board(board, &1))
  end

  def minimax(board, player, depth) do
    state = state(board)
    if state != :incomplete do
      value(state, player) / depth
    else
      values = Enum.map(next_boards(board), &(minimax(&1, player, depth + 1)))
      if player == current_player(board), do: Enum.max(values), else: Enum.min(values)
    end
  end

  def best_move(board) do
    Enum.max_by next_moves(board),
                &(minimax(next_board(board, &1), current_player(board), 1))
  end
end

# TicTacToe.best_move(["O", "_", "X", "X", "_", "_", "X", "O", "O"]) == 4
# TicTacToe.best_move(["_", "X", "_", "_", "_", "X", "O", "O", "X"]) == 2
