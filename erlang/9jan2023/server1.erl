-module(server1).
-behavior(gen_server).

-export([start_link/0, send_data/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2]).

start_link() ->
  gen_server:start_link(?MODULE, [], []).

  init([]) -> {ok,[]}.

send_data(Server2, {}) ->
  gen_server:call(Server2, {send_data, {}}).

handle_call({send_data, {}}, _From, State) ->
  {reply, ok, State}.
handle_cast(_Msg, State) ->
  {noreply, State}.
handle_info(_Info, State) ->
  {noreply, State}.
terminate(_Reason, _State) ->
  ok.