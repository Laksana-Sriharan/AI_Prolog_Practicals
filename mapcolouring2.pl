adjacent_regions(1, [2, 3, 4, 5, 6]).
adjacent_regions(2, [1, 3, 4, 5]).
adjacent_regions(3, [1, 2, 5, 6]).
adjacent_regions(4, [1, 2, 5]).
adjacent_regions(5, [1, 2, 3, 4, 6]).
adjacent_regions(6, [1, 3, 5]).


is_adjacent(Rx, Ry):-
    adjacent_regions(Rx, ARx),
    member(Ry, ARx).

colours([red, green,  blue, purple]).


equal(X,X).

nonconflict(colour(Rc,C), R, Nc):-
    is_adjacent(Rc, R),
    not(equal(C, Nc)).

nonconflict(colour(Rc,_C), R, _Nc):-
    not(is_adjacent(Rc, R)).


possible_colour([Col|ColouredRegions], R, Nc):-
    nonconflict(Col, R, Nc),
    possible_colour(ColouredRegions, R, Nc).

possible_colour([], _R, _Nc).


colour_regions(R, N,  RegionsColouredSofar, RegionsColoured):-
    R < N,
    R1 is R+1,
    colours(ColourList),
    member(N1, ColourList),
    possible_colour(RegionsColouredSofar, R1, N1),
    colour_regions(R1, N,  [colour(R1, N1)|RegionsColouredSofar], RegionsColoured).


colour_regions(N, N,  RegionsColouredSofar, RegionsColoured):-
    reverse(RegionsColouredSofar, RegionsColoured).


map_colour(Region_colours):-
    colour_regions(0, 6, [], Region_colours).
