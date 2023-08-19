
initial_state(s(w, w, w, w)).
goal_state(s(e,e,e,e)).

/* A state in which the hen is left with the grain or the wolf
     while the farmer is on the opposite side)
 *  is not a safe state.
 *  East and West are opposite sides.
 */

opp(e, w).
opp(w, e).
equal(X,X).

unsafe(s(F, H, G, W)) :-
    opp(F, H),
    (   equal(H, G) ;     % semicolon indicates "or" - alternate possibilities.
        equal(H, W)).

/* A state is safe if it is not unsafe */

safe(S) :- not(unsafe(S)).

move(s(S,H, G, W), s(S1, H, G, W), A):-
    opp(S, S1),
    safe(s(S1, H, G, W)),
    A='Farmer rows alone from'-S-to-S1.

move(s(S,S, G, W), s(S1, S1, G, W), A):-
    opp(S, S1),
    safe(s(S1, S1, G, W)),
    A='Farmer takes Hen from'-S-to-S1.


move(s(S,H, S, W), s(S1, H, S1, W), A):-
    opp(S, S1),
    safe(s(S1, H, S1, W)),
    A='Farmer takes Grain from'-S-to-S1.

move(s(S,H, G, S), s(S1, H, G, S1), A):-
    opp(S, S1),
    safe(s(S1, H, G, S1)),
    A='Farmer takes Wolf from'-S-to-S1.


children(Cs, Nss):- bagof(Ns, A^move(Cs, Ns, A), Nss).



bfs([Path|_Other_Paths], Gs, FP):-
    equal(Path, [Gs|_]),
    reverse(Path, FP).



bfs([Path|Other_paths], Gs, FP):-
    equal(Path, [Gs|_]),
    bfs(Other_paths, Gs, FP).


bfs([Path|Other_paths], Gs, FP):-
    equal(Path, [Cs|_P]), not(equal(Cs, Gs)),
    extend_path(Path, Paths),
    append(Other_paths, Paths, New_paths),
    bfs(New_paths, Gs, FP).

extend_path([Cs|RPath],Extndd_paths):-
    children(Cs, LCs),!,

    extnd_pth(LCs, [Cs|RPath], [], Extndd_paths).

extend_path(_, []).

extnd_pth([C|RLcs], Path, Paths,  Extndd_paths):-
    (   not(member(C, Path))->
    append(Paths, [[C|Path]], Extended_paths_C); equal(Extended_paths_C, Paths)),
    extnd_pth(RLcs, Path, Extended_paths_C, Extndd_paths).

extnd_pth([],_,P, P).



solve_by_bfs(Is, Gs, Path):-
    bfs([[Is]], Gs, Path).

/* Try the query as
   solve_by_bfs(a, m, Path).
and
note the values to Path,
to verify that the  shortest comes first
in the breadth-first-search.


Construct the graph represented by children/2 above
Represent the graph, using arc/2 predicate
like
      arc(a, b). arc(b, f).
etc.
and define children(C, LCs) as
            children(C, LCs):- bagof(Child, arc(C, Child), LCs).

It will fail if C has no child
as in the case of children defined at the top in this program
*/

/* Implement River-Crossing-1 (Farmer-Grain-Hen-Wolf) to solve
 *  by breadth-first-search
 */

