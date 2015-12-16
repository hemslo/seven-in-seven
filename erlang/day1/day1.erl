-module(day1).
-export([number_of_words/1, count_to_ten/0, display/1]).

% Write a function that uses recursion to return the number of words in a string.
number_of_words(String) -> count_array(string:tokens(String, " "), 0).
count_array([], Count) -> Count;
count_array([_|Tail], Count) -> count_array(Tail, Count + 1).

% Write a function that uses recursion to count to ten.
count_to_ten() -> counting(1).
counting(10) -> 10;
counting(Count) ->
  io:format("~.10B~n", [Count]),
  counting(Count + 1).

% Write a function that uses matching to selectively print “success” or “error: message” given input of the form {error, Message} or success.
display(success) -> io:format("success~n", []);
display({error, Message}) -> io:format("error: ~s~n", [Message]).
