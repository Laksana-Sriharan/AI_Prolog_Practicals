/*
a1-w-e Farmer goes alone from west to east
a2-w-e Farmer takes Grain from west to east
a3-w-e Farmer takes Hen from west to east
a4-w-e Farmer takes Wolf from west to east

a5-w-e Farmer goes alone from east to west
a6-w-e Farmer takes Grain from east to west
a7-w-e Farmer takes Hen from east to west
a8-w-e Farmer takes Wolf from east to west
*/
/*
F-side of farmer
G-side of grain
H-side of Hen
W-side of Wolf

s(F,G,H,W).
F,G,H,W take one of the two value(w,e)
initial state=s(w,w,w,w)
goal state=s(e,e,e,e)
*/

equal(X,X).
unequal(X,Y):- not(equal(X,Y)).

opp(S1,S2) :- unequal(S1,S2).

opp(e,w).
opp(w,e).

unsafe(s(F,G,H,W)) :-
    unequal(F,H),
    {
    	equal(G,H);
        equal(H,W)
    }.

safe(S):- not(unsafe(S)).

move(a1-w-e,s(w,G,H,W),s(e,G,H,W)):-
    safe(s(e,G,H,W)).
move(a2-w-e,s(w,w,H,W),s(e,e,H,W)) :-
    safe(s(e,e,H,W)).
move(a3-w-e,s(w,G,w,W),s(e,G,w,W)) :-
    safe(s(e,G,e,W)).
move(a4-w-e,s(w,G,H,w),s(e,G,H,e)) :-
    safe(s(e,G,H,e)).

move(a5-e-w,s(e,G,H,W),s(w,G,H,W)):-
    safe(s(w,G,H,W)).
move(a6-e-w,s(e,e,H,W),s(w,w,H,W)):-
    safe(s(w,w,H,W)).
move(a7-e-w,s(e,G,e,W),s(w,G,w,W)):-
    safe(s(w,G,w,W)).
move(a8-e-w,s(e,G,H,e),s(w,G,H,w)):-
    safe(s(w,G,H,w)).

action(A-D1-D2):- (A=a1;A=a5),
    format("Farmer rows along from ~s to ~s ~n",[D1,D2]).
action(A-D1-D2):- (A=a2;A=a6),
    format("Farmer takes ~s from ~s to ~s ~n",[grain,D1,D2]).
action(A-D1-D2):- (A=a3;A=a7),
    format("Farmer takes ~s from  ~s to ~s ~n",[hen,D1,D2]).
action(A-D1-D2):-(A=a4;A=a8 ),
    format("Farmer takes ~s from  ~s to ~s ~n",[wolf,D1,D2]).

find_path(GS,GS,Pathsofar,Path):-
    reverse(Pathsofar,Path).

find_path(CS,GS,Pathsofar,Path):-
    move(A1,CS,NS),
    not(member(NS-_X, Pathsofar)),
    find_path(NS,GS,[CS-A1| Pathsofar],Path).

write_action([_State-Action|Rest]):-
    action(Action), write_action(Rest).
write_action([]).

desc(w,west).
desc(e,east).
