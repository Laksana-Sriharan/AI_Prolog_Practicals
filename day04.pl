num_word(1, one).
num_word(2, two).
num_word(3, three).
num_word(4, four).
num_word(5, five).
num_word(6, six).
num_word(7, seven).
num_word(8, eight).
num_word(9, nine).
num_word(10, ten).

add1(N,N1):- N1 is N+1.

add_1(N,N1):- nonvar(N),N1 is N+1.
add_1(N,N1):- var(N),nonvar(N1),N is N1-1.
add_1(X,Y):- var(X),var(Y),X=0,add_1(X,Y).

/*Alkanes*/

/*alkane(1,methane).
alkane(2,ethane).
alkane(3,propane).
alkane(4,butane).
alkane(5,pentane).
alkane(6,hexane).
alkane(7,heptane).
alkane(8,octane).
alkane(9,nonane).
alkane(10,decane).*/



stem(1,meth).
stem(2,eth).
stem(3,prop).
stem(4,but).
stem(5,pent).
stem(6,hex).
stem(7,hept).
stem(8,oct).
stem(9,non).
stem(10,dec).


/*Alkene*/
alkene(N,Nm):- N>0 ,stem(N,Bn),atom_concat(Bn,ene,Nm).
/*Alkyne*/
alkyne(N,Nm):- N>0 ,stem(N,Bn),atom_concat(Bn,yne,Nm).
/*Alkane*/
alkane(N,Nm):-stem(N,Bn),atom_concat(Bn,ane,Nm).

