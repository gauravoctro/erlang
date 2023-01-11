-module(server2).
-behavior(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2]).

start_link() ->
  gen_server:start_link(?MODULE, [], []).

  init([]) -> {ok,[]}.

handle_call(_Request, _From, State) ->
  {reply, ok, State}.
handle_cast({send_data, {}}, State) ->
  io:format("~p~n", [{}]),
  {noreply, State}.
handle_info(_Info, State) ->
  {noreply, State}.
