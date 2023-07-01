/*
intersection([H|T], S2, S3):-
    intersection(T, S2, Ts),
    member(H,S2), S3 = [H|Ts].

intersection([H|T], S2, S3):-
    intersection(T, S2, Ts),
    not(member(H,S2)), S3 = Ts.
*/

/*
intersection([H|T], S2, [H|Ts]):-
    intersection(T, S2, Ts),
    member(H,S2).

intersection([H|T], S2, Ts):-
    intersection(T, S2, Ts),
    not(member(H,S2)).
*/
intersection([H|T], S2, S3):-
    intersection(T, S2, Ts),
    (   member(H,S2) ->   S3 = [H|T];
    					  S3 = Ts),!.

intersection([],_,[]):-!.
intersection(_,[],[]).

/*
union([H|S1],S2,S3):-
   	member(H,S2),
    union(S1,S2,S3),!.
    							
union([H|S1],S2,[H|S3]):-
   	not(member(H,S2)),
    union(S1,S2,S3),!.
*/
union([H|S1],S2,S3):-
    ( member(H,S2)->  union(S1,S2,S3);
    				union(S1,S2,S12),S3 = [H|S12]), !.
union([],S2,S2):-!.
union(S1,[],S1).
/*
remove_replicates([H|L1],L):-
    member(H,L1),
    remove_replicates(L1,L).

remove_replicates([H|L1],L):-
    not(member(H,L1)),
    remove_replicates(L1,L2), L =[H|L2].

remove_replicates([],[]).
*/

remove_replicates([H|L1],L):-
   (    member(H,L1)-> remove_replicates(L1,L);
   					   remove_replicates(L1,L11),
       						L=[H|L11]),!.
remove_replicates([],[]).

insertFirst(E,L,[E,L]).
insertNth(N,E,[],[E]):-N>0,!.
insertNth(1,E,L,[E|L]):-!.
insertNth(N,E,[H|T],[H|Te]):-
    N1 is N-1, insertNth(N1,E,T,Te).


insertLast(E,[H|T],[H|Te]):- insertLast(E,T,Te), !. 
insertLast(E,[],[E]).  