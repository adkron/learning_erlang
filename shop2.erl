-module(shop2).
-export([total/1]).
-import(lists, [map/2, sum/1]).

% total(L) ->
%   sum(map(fun({Item, Qty}) -> shop:cost(Item) * Qty end, L)).

% total using list comprehensions no longer needs inport of map
total(L) ->
  sum([shop:cost(Item) * Qty || {Item, Qty} <- L]).