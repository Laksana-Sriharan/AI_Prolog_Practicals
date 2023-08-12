%Set is a list with no duplicates
%S1=[1, 2, 3, 4, 3, 3, 1] = [1, 2, 3, 4]=[4, 1, 3, 2]
%set_equal(S1, S2).

subset([H|T], B):-
    member(H, B),
    subset(T, B).

subset([], _B).

set_equal(A, B):-
    subset(A, B), 
    subset(B, A).

superset(A, B):- subset(B, A).

set_intersection([H|T], B, IS):-
    set_intersection(T, B, BT), 
    (   member(H, B) ->   IS = [H|BT];
                          IS = BT
    ).

set_intersection([], _, []).

remove_duplicates([H|T], L):-
   remove_duplicates(T, Tx), 
   (   member(H, Tx) -> L = Tx;
                        L = [H|Tx]).

remove_duplicates([], []).


set_union([H|T], B, AUB):-
    set_union(T, B, TUB), 
    (   member(H, TUB) ->   AUB = TUB;
                            AUB = [H|TUB]).
set_union([], B, B).


make_set(L, S):- remove_duplicates(L, S).

set_difference([H|T], B, Result):-
    set_difference(T, B, Tx), 
    (   member(H, B) ->   Result = Tx;
                          Result = [H|Tx]),!.
    
set_difference([], _B, []):-!.   
set_difference(A, [], A).


insert_at_last(E, [H|T], [H|TE]):-
    insert_at_last(E, T, TE).

insert_at_last(E, [], [E]).


sum(L, Result):- sum3(L, 0, Result).

sum3([H|T], Sumsofar, Result):-
    Sumsofar1 is H + Sumsofar, 
    sum3(T, Sumsofar1, Result).

sum3([], Result, Result).









