-module(lib_misc).
-export([sum/1, for/3, qsort/1, pythag/1, perms/1, odds_and_evens/1, odds_and_evens_acc/1]).

% This is the suggestion from the book
% sum(L) -> sum(L,0).

% This saves an iteration
sum([H|T]) -> sum(T, H).
sum([H|T], Total) -> sum(T, Total + H);
sum([],Total) -> Total.

% for x to y, perform a function on the current iteration, return the results of each call in a list
for(Max, Max, F) -> [F(Max)];
for(I, Max, F)	-> [F(I)|for(I+1, Max, F)].

% quick sort
qsort([]) -> [];
qsort([Pivot|T]) ->
  qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).

% find all pythagorean tripples for a given n
pythag(N) -> [
  {A,B,C} ||
    A <- lists:seq(1,N),
    B <- lists:seq(1,N),
    C <- lists:seq(1,N),
    A+B+C =< N,
    A*A+B*B =:= C*C
  ].

% returns all permutations of a list
perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

%max
max(X,Y) when X > Y -> X;
max(X,Y) -> Y.

% get two list one of odds and one of evens from an input
odds_and_evens(L) ->
  Odds = [X || X <- L, (X rem 2) =:= 1],
  Evens = [X || X <- L, (X rem 2) =:= 0],
  {Odds, Evens}.

odds_and_evens_acc(L) ->
  odds_and_evens_acc(L, [], []);
odds_and_evens_acc([H|T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H|Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H|Evens])
  end;
odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:revers(Evens)}.