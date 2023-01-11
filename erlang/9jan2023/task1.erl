-module(task1).
-export([start_link/0,empl_get/4,close_com/1,init/1,handle_call/3,handle_cast/2,make_emp/3,handle_info/2]).
-behaviour(gen_server).

-record(emp, {name,id,state}).

start_link() -> gen_server:start_link(?MODULE,[],[]).

empl_get(Pid,Name,Id,State) -> 
                 gen_server:call(Pid,{empl,Name,Id,State}).



close_com(Pid) ->
          gen_server:call(Pid,teminate).


init([]) -> {ok,[]}.

handle_call({empl,Name,Id,State},_From,Empl) ->
                                if Empl =:= [] ->
                                    {reply,make_emp(Name,Id,State),Empl}; `
                                   Empl =/= [] ->
                                     {reply,hd(Empl),tl(Empl)}
                                end;



handle_call(terminate,_From,Empl) ->
                        {stop,normal,ok,Empl}.


                  
handle_cast({send_data, {}}, State) ->
  io:format("~p~n", [{}]),
  {noreply, State}.
handle_info(Msg, Empl) ->
                 io:format("With A Banng: ~p~n",[Msg]),
                 {noreply, Empl}.
make_emp(Name,Idd,Statee) ->
                #emp{name=Name,id=Idd,state=Statee}.