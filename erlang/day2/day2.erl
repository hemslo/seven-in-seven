-module(day2).
-export([keyfind/2, checkout/1, tic_tac_toe/1]).

% Consider a list of keyword-value tuples, such as [{erlang, "a functional lan- guage"}, {ruby, "an OO language"}]. Write a function that accepts the list and a keyword and returns the associated value for the keyword.

keyfind(List, Key) ->
  [{_, V} | _] = lists:filter(fun({K, _}) -> K == Key end, List),
  V.

% Consider a shopping list that looks like [{item, quantity, price}, ...]. Write a list comprehension that builds a list of items of the form [{item, total_price}, ...], where total_price is quantity times price.

checkout(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].

% Write a program that reads a tic-tac-toe board presented as a list or a tuple of size nine. Return the winner (x or o) if a winner has been determined, cat if there are no more possible moves, or no_winner if no player has won yet.

tic_tac_toe(Board) ->
  case Board of
    [X, X, X,
     _, _, _,
     _, _, _] when X /= "_" -> X;

    [_, _, _,
     X, X, X,
     _, _, _] when X /= "_" -> X;

    [_, _, _,
     _, _, _,
     X, X, X] when X /= "_" -> X;

    [X, _, _,
     X, _, _,
     X, _, _] when X /= "_" -> X;

    [_, X, _,
     _, X, _,
     _, X, _] when X /= "_" -> X;

    [_, _, X,
     _, _, X,
     _, _, X] when X /= "_" -> X;

    [X, _, _,
     _, X, _,
     _, _, X] when X /= "_" -> X;

    [_, _, X,
     _, X, _,
     X, _, _] when X /= "_" -> X;

    _ ->
      case lists:any(fun(X) -> X == "_" end, Board) of
        true -> no_winner;
        _ -> cat
      end
    end.
