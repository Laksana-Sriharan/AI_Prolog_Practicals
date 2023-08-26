sum1([D1|N1], [D2|N2], [D|N], CR, C, Digs1, Digs) :-

    sum1(N1,N2,N, CR, CLN, Digs1, Digs2),

    digsum(D1,D2, CLN, D, C, Digs2, Digs).

sum1([], [], [], C,C,D,D).


digsum(D1,D2, C1, D, C, Digs1, Digs) :-
    del_var(D1, Digs1, Digs2),   % get D1 an available digit, after that
    del_var(D2, Digs2, Digs3),   % available digits are in Digs2
    del_var(D,  Digs3, Digs),
    S is D1+D2+C1,
    D is S mod 10,               % mod gives the remainder of division
    C is S // 10.                % // gives integer part of division

del_var(A,L,L) :-
    nonvar(A), !.                % A is already instantiated

del_var(A, [A|L], L).
del_var(A, [B|L], [B|L1]) :-
    del_var(A,L,L1).


sum(Num1, Num2, [D|Num3x]):-
   sum1(Num1, Num2,[D|Num3x], 0, 0, [1, 2, 3, 4, 5, 6, 7, 8, 9,0],_), D>0.   %Underscore _ means anonymous variable



 solve_puzzle(Nm1, Nm2, Nm3):-puzzle(Nm1, Nm2, Nm3), sum(Nm1, Nm2, Nm3).

%puzzle([D, O, _N, A, L, D], [_G, E, R, A, L, D], [R, O, _B, E, R, _T]).
%puzzle([0, _S, E, N, _D], [0, M, O, _R, E], [M, O , N, E, _Y]).
%puzzle([I, _T], [I, _S], [_M, _E]).
%puzzle([0, T, W, O], [0, T, W, O], [_F, O, _U, _R]).
%puzzle([0, _C, R, O, S, S], [0, R, O, A, D, S], [D, A, _N, _G, _E, R]).
%puzzle([M, O, M], [D, A, D], [ S, O, N]).
puzzle([0, 0, U,S,A], [0, U,S,S,_R], [_P,E,A,_C,E]).
%
%
%
%
%  0  S E N D
%  0  M O R E
%  M  O N E Y

mydel_var(A,L,L):-
    nonvar(A),!.
mydel_var(A,[A|L],L).
mydel_var(A, [B|L], [B|L1]) :-
    mydel_var(A,L,L1).
