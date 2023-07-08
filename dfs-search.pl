child(a,b).
child(a,c).
child(a,d).

child(b,e).
child(b,f).

child(c,g).
child(c,h).

child(d,i).
child(d,j).

child(e,k).
child(f,l).
child(g,m).

child(h,n).
child(h,o).

child(i,p).
child(i,q).

child(j,r).
child(j,s).

successors(Node,SuccList):- 
    bagof(Child,child(Node,Child),SuccList).

find_path(Goal,Goal, PathSofar, FinalPath):-
    reverse([Goal|PathSofar], FinalPath).

find_path(CN,Goal,PathSofar,FinalPath):-
    child(CN,Next),
    find_path(Next,Goal,[CN|PathSofar],FinalPath).










