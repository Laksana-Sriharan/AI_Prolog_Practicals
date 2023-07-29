/*Three missionaries and three cannibels*/

/*State definition */
  /*s(M,C,B). represents the number of Missionarries, Cannibels and Boards, on the west at an instance of time that is , 3-M Missionaries, 3-C cannibels, 1-B Board are on the east.*/      
% What  is the initial state? missionaries and cannibals and the board are on the west
initial_state(s(3,3,1)).


/* what is the Goal state? */
goal_state(s(0,0,_)).
unsafe(s(M,C,_)):- M>0,M<C;
    /* 3-M>0, 3-M<3-C*/
  ( M < 3, M > C  ).

safe(S):-not(unsafe(S)).
% a1- one missionary can row the board from west to east
% a2- two missionaries can row the board from west to east
% a3-one cannibel can row the board from west to east
% a4-one cannibel and one missionary can row the board from west to east
% a5- two cannibels can row the board from west to east

% a6- one missionary can row the board from  east to west 
% a7- two missionaries can row the board from east to west
% a8-one cannibel can row the board from east to west
% a9-one cannibel and one missionary can row the board from east to west
% a10- two cannibels can row the board from east to west

move(a1-w-e, s(M,C,1), s(M1,C,0)):-
    M>0,M1 is M-1,
    safe(s(M1,C,_)).

move(a2-w-e, s(M,C,1), s(M1,C,0)):-
    M>1,M1 is M-2,
    safe(s(M1,C,_)).

move(a3-w-e, s(M,C,1), s(M,C1,0)):-
    C>0,C1 is C-1,
    safe(s(M,C1,_)).

move(a4-w-e, s(M,C,1), s(M1,C,0)):-
   M>0,M1 is M-1,
    C>0,C1 is C-1,
    safe(s(M1,C1,_)).

move(a5-w-e, s(M,C,1), s(M,C1,0)):-
    C>1,C1 is C-2,
    safe(s(M,C1,_)).

move(a6-e-w, s(M,C,0), s(M1,C,1)):-
    M<3,M1 is M+1,
    safe(s(M1,C,_)).

move(a7-e-w, s(M,C,0), s(M1,C,1)):-
    M<2,M1 is M+2,
    safe(s(M1,C,_)).

move(a8-e-w, s(M,C,0), s(M,C1,1)):-
    C<3,C1 is C+1,
    safe(s(M,C1,_)).

move(a9-e-w, s(M,C,0), s(M1,C,1)):-
   M<3,M1 is M+1,
    C<3,C1 is C+1,
    safe(s(M1,C1,_)).

move(a10-e-w, s(M,C,0), s(M,C1,1)):-
    C<2,C1 is C+2,
    safe(s(M,C1,_)).

find_path(GS,GS,Pathsofar,Path):-
    reverse(Pathsofar,Path).

find_path(CS,GS,Pathsofar,Path):-
    move(A1,CS,NS),
    not(member(NS-_X, Pathsofar)),
    find_path(NS,GS,[CS-A1| Pathsofar],Path).

action(A-D1-D2):-(A=a1; A=a6),
    format("~s rows from ~s to ~s~n",["1M",D1,D2]).
action(A-D1-D2):-(A=a2; A=a7),
    format("~s rows from ~s to ~s~n",["2M",D1,D2]).
action(A-D1-D2):-(A=a3; A=a8),
    format("~s rows from ~s to ~s~n",["1C",D1,D2]).
action(A-D1-D2):-(A=a4; A=a9),
    format("~s rows from ~s to ~s~n",["1M 1C",D1,D2]).
action(A-D1-D2):-(A=a5; A=a9),
    format("~s rows from ~s to ~s~n",["2C",D1,D2]).

write_action([_State-Action|Rest]):-
    action(Action), write_action(Rest).
write_action([]).

    



