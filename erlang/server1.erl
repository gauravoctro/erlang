-module(server1).
-export([start_link/0,send_data/0,handle_call/3,handle_cast/2,handle_info/2,init/1]).
-behaviour(gen_server).


start_link() -> gen_server:start_link({local,server1},server1, [],[]).
init(State) -> 
    {ok,_Pid} = server2:start_link(),
{ok,State}.

send_data() ->
    gen_server:call(server1,data).

handle_call(data, _From, State) ->
   gen_server:cast(server2, message),
    {reply, ok, State}.
handle_cast(_Msg, State) ->
  {noreply, State}.
handle_info(_Info, State) ->
  {noreply, State}.

