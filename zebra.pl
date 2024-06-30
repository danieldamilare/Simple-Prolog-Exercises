% This is a solution to the classic zebra puzzle.
solution(Zebra,England,Spain,Ukraine,Japan,Norway) :-

    England=Red, Spain=Dog, Coffee=Green, Ukraine=Tea,
    left(Ivory,Green), Winston=Snail, Kool=Yellow,
    middle_pos(Milk), leftmost_pos(Norway),
next_to(Chesterfield,Fox), next_to(Kool,Horse),
LuckyStrike=OJ, Japan=Parliament, next_to(Norway,Blue),

% The five lists: houses, nations, pets, drinks, cigarettes
uniq_pos(Green,Red,Yellow,Ivory,Blue),
uniq_pos(England,Spain,Ukraine,Japan,Norway),
uniq_pos(Dog,Snail,Zebra,Fox,Horse),
uniq_pos(Tea,Milk,OJ,Coffee,OtherDrink),
uniq_pos(Winston,Kool,Parliament,Chesterfield,LuckyStrike).

 %-------------- The positional predicates -------------------
 uniq_pos(P1, P2, P3, P4, P5) :-
     pos(P1), pos(P2), \+ P1 = P2, pos(P3), \+ P2 = P3, \+ P1 = P3,
     pos(P4), \+ P1 = P4, \+ P2 = P4, \+ P3 = P4, pos(P5), \+ P1 = P5,
     \+ P2 = P5, \+ P3 = P5, \+ P4 = P5.

 pos(1). pos(2). pos(3). pos(4). pos(5).
 leftmost_pos(1). middle_pos(3).
 left(1, 2). left(2, 3). left(3, 4). left(4, 5).
 next_to(X, Y) :- left(X, Y).
 next_to(X, Y) :- left(Y, X).

print_solution :-
    solution(Zeb, E, S, U, J, N), pmatch(Zeb, E, 'English'), 
    pmatch(Zeb, S, 'Spanish'), pmatch(Zeb, U, 'Ukranian'), 
    pmatch(Zeb, J, 'Japanese'), pmatch(Zeb, N, 'Norwegian').

pmatch(X, X, Name) :-  
    nl, write('The zebra owner is '), write(Name).
pmatch(X, Y, Name) :- \+ X= Y.
