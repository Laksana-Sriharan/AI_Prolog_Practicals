   person(bert,    55, m, carpenter).
   person(allan,   25, m, football_player).
   person(allan,   25, m, butcher).
   person(john,    25, m, pickpocket).
   person(barbara, 22, f, hairdresser).

   had_affair(barbara, john).
   had_affair(barbara, bert).
   had_affair(susan, john).

   killed_with(susan, club).
   killed(susan).

   motive(money).
   motive(jealousy).
   motive(righteousness).

   smeared_in(bert, blood).
   smeared_in(susan, blood).
   smeared_in(allan, mud).
   smeared_in(john, chocolate).
   smeared_in(barbara, chocolate).

   owns(bert, wooden_leg).
   owns(john, pistol).

/* * * Background knowledge * * */

   operates_identically(wooden_leg, club).
   operates_identically(bar, club).
   operates_identically(pair_of_scissors, knife).
   operates_identically(football_boot, club).

   owns_probably(X, football_boot) :-
      person(X, _, _, football_player).
   owns_probably(X, pair_of_scissors) :-
      person(X, _, _, hairdresser).
   owns_probably(X, Object) :-
      owns(X, Object).

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

   suspect(X) :-
      killed_with(susan, Weapon) ,
      operates_identically(Object, Weapon) ,
      owns_probably(X, Object).

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

   suspect(X) :-
      motive(jealousy) ,
      person(X, _, m, _) ,
      had_affair(susan, X).

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

   suspect(X) :-
      motive(jealousy) ,
      person(X, _, f, _) ,
      had_affair(X, Man) ,
      had_affair(susan, Man).

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

   suspect(X) :-
      motive(money) , person(X, _, _, pickpocket).

   killer(Killer) :-
      person(Killer, _, _, _) ,
      killed(Killed) ,
      Killed \= Killer , /* It is not a suicide */
      suspect(Killer) ,
      smeared_in(Killer, Goo) ,
      smeared_in(Killed, Goo).

go:-killer(X), killed(Y), Z=..[killed, X, Y], write(Z).










