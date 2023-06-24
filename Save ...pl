/*List
 * membership
 * member(X,L) is true if X is a member of L,otherwise false
 * List = [Head|Tail], Head - first element,
 * [apple,banana,grapes] = [Head|Tail] - this means
 * Head = apple , Tail = [banana,grapes]
 * 
 * [[apple,60],[banana,30],[grapes,120]] = [Head|Tail] 
 * Head = [apple,60]
 * Tail = [[banana,30],[grapes,120]]
 * Length(List,Result)-true if Result is equal to the no.of elements in the list
 * Length(i,i);Length(i,o)
 */

my_member(X,[X|_]). /* Here underscore is an anonymous variable.*/
my_member(X,[_|Tail]):-my_member(X,Tail).


/*count the occurence of a member in a list */

count0(X,Ls,Cx):-Ls = [X|Tail],count0(X,Tail,Cxt),
    				  Cx is 1 + Cxt.

count0(X,Ls,Cx):-Ls = [Y|Tail], X\=Y, count0(X,Tail,Cx).
count0(_X,[],0).   


count1(X,[X|Tail],Cx):- count1(X,Tail,Cxt),
    				  Cx is 1 + Cxt.

count1(X,[Y|Tail],Cx):-X\=Y, count1(X,Tail,Cx).
count1(_X,[],0).   


equal(Term,Term).

count(X,[X|Tail],Cx):- count(X,Tail,Cxt),
    				  Cx is 1 + Cxt.

count(X,[Y|Tail],Cx):-not(equal(X,Y)), count(X,Tail,Cx).
count(_X,[],0). 


/* Tail Recursion Factorial   */
factorial_Tail(N,F,Fn):-
        N > 1 ,
        N1 is N-1,
        Fn1 is N * F,
        factorial_Tail(N1,Fn1,Fn).


factorial_Tail(0,F,F).
factorial_Tail(1,F,F).

/* Non-Tail Recursion Factorial  */
factorial_NT(N,F):-
        N > 1 ,
        N1 is N-1,
        factorial_NT(N1,F1),
		F is N * F1.

factorial_NT(1,1).






