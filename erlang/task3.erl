-module(task3).

-export([start_link/0,log_call/1,init/1,handle_call/3,handle_cast/2]).
-behaviour(gen_server).

start_link() -> gen_server:start_link({local,task3},task3,[],[]).

init(State) -> 
    gen_server:cast(self(), abc),
    gen_server:cast(self(), abcd),
    gen_server:cast(self(), abcde),
    {ok, State}.

log_call(Pid) ->
    gen_server:call(Pid,log_call).



handle_cast(abc, State) ->
  io:format("hum first start ~n"),
  timer:sleep(2000),
  io:format("hum first end ~n"),
  {noreply, State};

handle_cast(abcd, State) ->
    io:format("hum second start~n"),
    timer:sleep(2000),
    io:format("hum second end ~n"),
    {noreply, State};

handle_cast(abcde, State) ->
        io:format(" hum third start~n"),
        timer:sleep(2000),
        io:format("hum third end~n"),
        {noreply, State}.

handle_call(log_call, _From, State) ->
    io:format(" in call ~n"),
  {reply, ok, State}.