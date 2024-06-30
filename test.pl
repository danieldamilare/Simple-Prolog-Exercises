chicken(2).
cow(4).
animal(X, Y) :-
    chicken(ChickenLeg), cow(CowLeg),
    Chicken + Cow is X,
    (Chicken * ChickenLeg) + (Cow * CowLeg) is Y,
    nl, write('No of Chickens: '), write(Chicken),
    nl, write('No of Cows: '), write(Cow).


