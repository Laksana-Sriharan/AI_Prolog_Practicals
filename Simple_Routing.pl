road(houston,tampa,200).
road(gordon,tampa,300).
road(houston,kansas_city,120).
road(houston,gordon,100).
road(gordon,kansas_city,130).

route(Town1,Town2,Distance):-
     road(Town1,Town2,Distance).


route(Town1,Town2,Distance):-
    road(Town1,Town3,Distance13),
    road(Town3,Town2,Distance32),
    Distance is Distance13+ Distance32.

route5(Town1,Town2,Distance,PathSofar,[Town2|PathSofar]):-
     road(Town1,Town2,Distance).

route5(Town1,Town2,Distance,PathSofar,FinalPath):-
    road(Town1,Town3,Distance13),
    route5(Town3,Town2, Distance32, [Town3|PathSofar],FinalPath),
    Distance is Distance13 + Distance32.