/*person(id001,name(mary),gender(f),hobbies([])).
person(id001,mary,f,[]).*/

% name ,gender,hobbies are functors representing attribute names.

person(id001,[name(mary),age(56),gender(f),hobbies([])]).
person(id002,[name(john),age(14),gender(m),hobbies([])]).
person(id003,[name(jane),gender(f),age(23),hobbies([])]).
person(id004,[name(elaine),gender(f),hobbies([]),age(34)]).
person(id005,[name(kevin),age(63),hobbies([]),gender(m)]).

/* 
 	person(ID,Details),
	member(gender(m),Details),
	member(name(Nm),Details),
	member(age(A),Details),
	format("~w -~w: ~w",[ID,Nm,A]).
    
*/


/*
 * 
 * 	format("~d ~n ~D",[123456789,123456789]).
 	format("~d~n~D",[123456789,123456789]).
 	format("~15d~n~15D",[123456789,123456789]).
 	format("~d~n~D~n",[123456789,123456789]),
	format("~e~n~E~n",[123.45678,123.45678]).
    format("~f~n~g~n",[123.45678,123.45678]),
	format("~d~n~2r~n~8r~n~16r~n",[1020,1020,1020,1020]).
 */

/* List the ID of females
 	 person(_,Details),
	member(age(A),Details),
	A>50,
	member(name(Nm),Details),
	format("~w is of age ~d~n",[Nm,A]).
 */



























