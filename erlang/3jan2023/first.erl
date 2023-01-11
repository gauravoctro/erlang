-module(first).
-export([add/2,factorial/2,factorial/1,area/3,area/1,speak/1]).

%% simple add function
add(X,Y) ->
	  X+Y.

%% factorial function - tail recursion
factorial(N) when N>0 ->
	     N*factorial(N-1);
factorial(0) ->
	     1.

%% case statement 
area(Type,N,M) ->
	       case Type of
	       	    square -> N*N;
		    circle -> math:pi()*N*N;
		    triangle -> 0.5*N*M
		end.

%% case statement pattern matching
area({square,N}) ->
		 N*N;
area({circle,R}) ->
		 math:pi()*R*R;
area({triangle,B,H}) ->
		 0.5*B*H;
area(_) ->
	{error,invalidObject}.


%% if statement 
speak(Animal) ->
	      Talk = if
	      	   (Animal == cat) -> meow;
		   (Animal == dog) -> bark;
		   true -> no_animal
		end,
	io:format("~w says ~w ~n",[Animal,Talk]).



%% factorial function - using accumulator
factorial(N,TotalFactorial) when N>0 ->
			    factorial(N-1,N*TotalFactorial);
factorial(0,Totalfactorial) ->
			    Totalfactorial.