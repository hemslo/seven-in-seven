% Some implementations of a Fibonacci series and factorials. How do they work?
fib(0, 0).
fib(1, 1).
fib(N, Value) :- N > 1, N1 is N - 1, N2 is N - 2, fib(N1, V1), fib(N2, V2), Value is V1 + V2.

factorial(0, 1).
factorial(N, Value) :- N > 0, N1 is N - 1, factorial(N1, V1), Value is N * V1.

% A real-world community using Prolog. What problems are they solving with it today?
% If you’re looking for something more advanced to sink your teeth into, try these problems:
% An implementation of the Towers of Hanoi. How does it work?
hanoi(1, A, _, C) :- write(A), write(' to '), write(C), nl.
hanoi(N, A, B, C) :- N > 1, M is N - 1, hanoi(M, A, C, B), hanoi(1, A, _, C), hanoi(M, B, A, C).

% What are some of the problems of dealing with “not” expressions? Why do you have to be careful with negation in Prolog?

% Reverse the elements of a list.
reverse_list([], []).
reverse_list([Head|Tail], R) :- reverse_list(Tail, Temp), append(Temp, [Head], R).

% Find the smallest element of a list.
smallest([N], N).
smallest([Head|Tail], N) :- smallest(Tail, M), N is min(Head, M).

% Sort the elements of a list.
sorted([]).
sorted([_]).
sorted([First, Second | Tail]) :- First =< Second, sorted([Second | Tail]).
sort_list(List, Sorted) :- permutation(List, Sorted), sorted(Sorted).
