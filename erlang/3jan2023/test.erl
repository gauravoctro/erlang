-module(test).
-export([start/0]).

start()->
	Numbers = [1, 2, 3, 4, 5],
	Sum = lists:sum(Numbers),
	Sum.