child(a,b).
child(a,c).
child(a,d).

child(b,e).
child(b,f).

child(c,g).
child(c,j).

child(d,k).
child(d,h).

child(f,i).
child(f,j).

child(g,k).

successors(Node,SuccList):- 
    bagof(Child,child(Node,Child),SuccList).

find_path(Goal,Goal, PathSofar, FinalPath):-
    reverse([Goal|PathSofar], FinalPath).

find_path(CN,Goal,PathSofar,FinalPath):-
    child(CN,Next),
    find_path(Next,Goal,[CN|PathSofar],FinalPath).