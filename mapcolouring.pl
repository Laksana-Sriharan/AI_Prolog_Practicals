
adjacent_regions(r1, [r2, r4]).
adjacent_regions(r2, [r1, r3]).
adjacent_regions(r3, [r2, r4]).
adjacent_regions(r4, [r1, r3]).

is_adjacent(Rx, Ry):-
    adjacent_regions(Rx, ARx),
    member(Ry, ARx).

colours([red, green,  blue, purple]).

region(1, r1).
region(2, r2).
region(3, r3).
region(4, r4).

equal(X,X).

unequal(colour(Rc,C), R, Nc):-
    region(Rc, Rcn),
    region(R,   Rn),
    is_adjacent(Rcn, Rn),
    not(equal(C, Nc)).

unequal(colour(Rc,_C), R, _Nc):-
    region(Rc, Rcn),
    region(R,   Rn),
    not(is_adjacent(Rcn, Rn)).


can_colour([Col|ColouredRegions], R, Nc):-

    unequal(Col, R, Nc),
    can_colour(ColouredRegions, R, Nc).

can_colour([], _R, _Nc).


colour_regions(R, N, RegionsColouredSofar, RegionsColoured):-
    R < N,
    R1 is R+1,
    colours(ColourList),
    member(N1, ColourList),
    can_colour(RegionsColouredSofar, R1, N1),
    colour_regions(R1, N,  [colour(R1, N1)|RegionsColouredSofar], RegionsColoured).


colour_regions(N, N,  RegionsColouredSofar, RegionsColoured):-
    reverse(RegionsColouredSofar, RegionsColoured).


map_colour(Region_colours):-
    colour_regions(0, 4, [], Region_colours).








