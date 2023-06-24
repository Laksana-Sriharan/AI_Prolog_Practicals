/* Book Name : Artificial Intelligence-A modern approach,
 * Edition : 3rd edition
 * Authors : Stuart Russell , Peter Norvig,
 * Publishers : Prentice Hall 
 * Year : 2010
 * 
 * Book Name : Artificial Intelligence,
 * Edition : 3rd edition
 * Authors : Elaine Rich,Kevin Knight ,Shivasankar Nair
 * Publishers : McGraw Hill 
 * Year : 2009
 * 
 * Book Name : Data Structures & Algorithms in Java,
 * Edition : 6th edition
 * Authors : Micheal goodrisch,Roberto Tamassia,Micheal Goldwasser
 * Publishers : Wiley
 * Year : 2014
 * 
 * */

/* Book Detials */

book(artificial-intelligence-a-modern-approach,third,[stuart-russell ,peter-norvig],prentice-hall,2010).
book(artificial-intelligence,third,[elaine-rich,kevin-knight ,shivasankar-nair],mcgraw-hill ,2009).
book(data-structures-algorithms-in-java,third,[micheal-goodrisch,roberto-tamassia,micheal-goldwasser],wiley,2014).


book([title("Artificial Intelligence-A modern approach"),
       edition(3),
       authors([ "Stuart Russell" , "Peter Norvig"]),
       publisher(prentice-hall),
       year(2010)]).

book([title("Artificial Intelligence"),
       edition(3),
       authors([ "Elaine Rich","Kevin Knight" ,"Shivasankar Nair"]),
       publisher(mcgraw-hill) ,
       year(2009)]).

book([title("Data Structures & Algorithms in Java"),
       edition(3),
       authors(["Micheal goodrisch","Roberto Tamassia","Micheal Goldwasser"]),
       publisher(wiley),
       year(2014)]).

/* Person name : John ,
 * Age : 26 ,
 * Gender : Male ,
 * Hobby : painting .
 * 
 * Person name : Mala ,
 * Age : 21 ,
 * Gender : Female ,
 * Hobby : dancing .
 * 
 * Person name : Jeffy ,
 * Age : 18 ,
 * Gender : Male ,
 * Hobby : painting .
 * 
 * */

/* Person Detials */

person([name(john),age(26),gender(male),hobby([painting,gardening])]).
person([name(mala),age(21),gender(female),hobby([dancing,singing])]).
person([name(jeffy),age(18),gender(male),hobby([painting,singing])]).




commonHobby(HL1,HL2,CH):-
    member(CH,HL1),member(CH,HL2).

commonHobbies(HL1,HL2,CHs):-
    bagof(CH,commonHobby(HL1,HL2,CH),CHs).









