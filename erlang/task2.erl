-module(task2).
-export([]).
-behaviour(gen_server).

%% API
-export([ start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2]).
-record(state, {dummy}).

start_link(Name) ->
    gen_server:start_link({local, Name}, ?MODULE, [], []).

init(_Args) ->
    {ok, #state{dummy=1}}.


handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

