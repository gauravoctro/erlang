-module(server2).
-behavior(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,empl_get/4]).
-record(emp, {name,id,state}).
start_link() ->
  gen_server:start_link(?MODULE, [], []).

init([]) ->
  gen_server:cast(self(), abc),    
  {ok,[]}.
  
    
empl_get(Pid,Name,Id,State) -> 
                 gen_server:call(Pid,{empl,Name,Id,State}).


handle_call({empl,Name,Id,State},_From,Empl) ->
                                if Empl =:= [] ->
                                    {reply,make_emp(Name,Id,State),Empl};
                                   Empl =/= [] ->
                                     {reply,hd(Empl),tl(Empl)}
                                end;
handle_call(_Request, _From, State) ->
  {reply, ok, State}.
handle_cast(message, State) ->
    io:format("Received message: ~p ~p ~n", [message,is]),
    {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.
make_emp(Name,Idd,Statee) ->
                #emp{name=Name,id=Idd,state=Statee}.