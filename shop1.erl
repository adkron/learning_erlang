-module(shop1).
-export([total/1]).

%Takes a list of tuples ie. [{itemName, quantity}]
total([{Item, Qty}|T]) -> shop:cost(Item) * Qty + total(T);
total([]) -> 0.