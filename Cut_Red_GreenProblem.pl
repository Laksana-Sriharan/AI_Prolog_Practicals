p(1). p(2). p(3).
q(a). q(b).
r(x). r(y). r(z).

t1(V1,V2,V3):-p(V1),q(V2),r(V3).
t11(V1,V2,V3):-!,p(V1),q(V2),r(V3).
t2(V1,V2,V3):-p(V1),!,q(V2),r(V3).
t3(V1,V2,V3):-p(V1),q(V2),!,r(V3).
t4(V1,V2,V3):-p(V1),q(V2),r(V3),!.


/* Red cut :- When removing it the code may not work correctly.if we use carefully code efficiently */

max(X,Y,X):- X>=Y.
max(X,Y,Y):- X<Y.

maxG(X,Y,X):- X>=Y,!.
maxG(X,Y,Y):- X<Y.

maxRed(X,Y,X):- X>=Y,!.
maxRed(_,Y,Y).

maxRedWrong(X,Y,X):- X>=Y.
maxRedWrong(_,Y,Y).


max_in_list([H],H):-!.
max_in_list([H|T],M):-
    max_in_list(T,MT),
    max_in_list(H,MT,M).



