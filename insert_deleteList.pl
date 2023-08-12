%insert(E,N,L,LE).
%insert(i,i,i,o).
%insert(+,+,+,-).

insert(E,1,L,[E|L]):-!.
insert(E,N,[H|T],[H|TE]):-
    N>1,N1 is N-1,
    insert(E,N1,T,TE), !.

insert(E,_,[],[E]).

delete(1,[_|T],T):- !.
delete(N,[H|T], [H|Tx]):-
    N>1, N1 is N-1,
    delete(N1, T, Tx),!.

delete(_,[],[]).

insert_ew(E,L,[E|L]).
insert_ew(E,[H|T],[H|Te]):-
    insert_ew(E,T,Te).

permute([H|T],PL):-
    permute(T,Pt),
    insert_ew(H,Pt,PL).

permute([],[]).

    
