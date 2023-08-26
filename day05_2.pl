%River crossing 
%A family of father,mother,two daughters and two sons
%along with a policeman and a thief
%state can be represented by a tuple wih the number of each of 
%people staying on the west bank.
%(F,M,D,S,P,T,B)

%No will stay with the thief if the policeman is not around 
unsafe(s(F,M,D,S,P,T,_)):-
    N is F+M+D+S,
    (P=0, T=1,N>0);
    (P=1,T=0,N<6   ).

%No daughters will stay with the mother if father is not around
unsafe(s(F,M,D,_S,P,T,_)):-
    (F=0, M=1,D>0);
    (F=1,M=0,D<2).


%No SONS will stay with the father if mother is not around
unsafe(s(F,M,_D,S,_P,_T,_)):-
    (F=1, M=0,S>0);
    (F=0,M=1,S<2).

safe(S): - not(unsafe(S)).

move(father-w-e, s(1, M, D, S, P, T, 1), s(0, M, D, S, P, T, 0)):-
    safe(s(0, M, D, S, P, T, 0)).

move(father-e-w, s(0, M, D, S, P, T, 0), s(1, M, D, S, P, T, 1)):-
    safe(s(1, M, D, S, P, T, 1)).

move(fater_mother-w-e,s(1,1,D,S,P,T,1), s(0,0, D, S, P, T, 0)):-
     safe(s(0,0, D, S,P,T,0)).

move(fater_mother-e-w,s(0,0,D,S,P,T,0), s(1,1, D, S, P, T, 1)):-
     safe(s(1,1, D, S,P,T,1)).


move(fater_daughter-w-e,s(1,M,D,S,P,T,1), s(0,0, D1, S, P, T, 0)):-
    D>0,D1 is D-1,
    safe(s(0,M, D1, S,P,T,1)).


move(father_daughter-e-w, s(0, M, D, S, P, T, 0), s(1, M, D1, S, P, T, 1)):-
    D < 2, D1 is D + 1,
    safe(s(1, M, D, S, P, T, 1)).

move(police_father-w-e, s(1, M, D, S, 1, T, 1), s(0, M, D, S, 0, T, 0)):-
    safe(s(1, M, D, S, P, T, 1)).


