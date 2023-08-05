/*
 *  Water Jug Problem
 * 
 * M litre jug, N litre gcd(M,N) = 1
 
 
 
 * 
*/

%state(x,y). % x litre in M-litre jug, y litre in N-Litre jug

initial_state(state(0,0)).
goal_state([state(0,2),state(2,0)]).

/*
 * a1 - fill M litre jug from the barrel
 * a2 - empty M litre jug into the barrel
 * a3 - fill N litre jug from the barrel
 * a4 - empty M litre jug from the barrel
 * a5 - transfer from M litre jug into N-litre jug until M-litre jug is empty
 *  without  overflowing.
 * a6 - transfer from M litre jug into N-litre jug until N-litre jug is full 
 * without overflowing.
 * a7 - transfer from N litre jug into M-litre jug until N-litre jug is empty 
 * without overflowing.
 * a8 - transfer from N litre jug into M-litre jug until M-litre jug is full 
 * without overflowing.
 * 
 * */

capacity(m,3).
capacity(n,5).

move(a1,state(X,Y),state(M,Y)):-
	capacity(m,M), X<M.

move(a2,state(X,Y),state(0,Y)):-
	 X>0.

move(a3,state(X,Y),state(X,N)):-
	capacity(n,N), Y<N.

move(a4,state(X,Y),state(X,0)):-
	 Y>0.

move(a5,state(X,Y),state(X1,Y1)):-
	 X>0,
     capacity(n,N),
	 Y1 is X + Y,
	 Y1 =<N.

move(a6, state(X, Y), state(X1, N)):-
    capacity(n, N),
    X > 0,
    Y1 is X + Y,
    Y1 >= N, 
    X1 is N -Y1.

move(a7, state(X, Y), state(X1, 0)):-
    Y > 0, 
    capacity(m, M),
    X1 is X + Y,
    X1 =< M.

move(a8, state(X, Y),state(M,Y)):-
    capacity(m, M),
	Y > 0,
	X1 is X + Y,
    X1 >= M,
    Y1 is M - X1.

find_path(CS, LGS, Pathsofar, Path):-
    member(CS, LGS),
    reverse(Pathsofar, Path).

find_path(CS, LGS, Pathsofar, Path):-
    not(member(CS, LGS)),
    move(Act, CS, NS),
    not(member(NS, Pathsofar)),
    find_path(NS, LGS, [NS|Pathsofar], Path).

get_path(Path):-
    initial_state(IS),
    goal_state(LGS),
    find_path(IS, LGS, [IS], Path).

