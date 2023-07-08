hanoi(N,Source,Destination,_Auxiliary) :-
    N = 1,
    move_disc(N,Source,Destination).
    
hanoi(N,S,D,A):-
    N > 1,
    N1 is N-1,
    hanoi(N1,S,D,A),
    move_disc(N,S,D),
    hanoi(N1,A,D,S).

move_disc(N,Source,Destination):-
	format("Move Disc ~d from ~w to~w ~n",[N,Source,Destination]).