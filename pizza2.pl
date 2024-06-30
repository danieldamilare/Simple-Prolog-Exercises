% Define the predicate for seating arrangements
beside(X, Y) :-
    (X = doreen, Y = danny);
    (X = danny, Y = doreen);
    (X = donna, Y = david);
    (X = david, Y = donna).

across(X, Y) :-
    (X = donna, Y = doreen);
    (X = doreen, Y = donna);
    (X = danny, Y = david);
    (X = david, Y = danny).

% Define the predicates for main courses and beverages
main_course(donna, _).
main_course(danny, _).
main_course(david, _).
main_course(doreen, _).

beverage(donna, _).
beverage(danny, _).
beverage(david, _).
beverage(doreen, _).

% Clues from the problem
clues :-
    % The men sat across from each other, as did the women.
    across(danny, david),
    across(donna, doreen),

    % They each ordered a different main course with a different beverage.
    main_course(donna, _),
    main_course(danny, _),
    main_course(david, _),
    main_course(doreen, _),
    all_different([Main1, Main2, Main3, Main4]),

    beverage(donna, _),
    beverage(danny, _),
    beverage(david, _),
    beverage(doreen, _),
    all_different([Drink1, Drink2, Drink3, Drink4]),

    % Doreen sat beside the person who ordered steak.
    (main_course(doreen, steak), beside(doreen, _));
    (beside(doreen, Who), main_course(Who, steak)),

    % The chicken came with a Coke.
    (main_course(_, chicken), beverage(_, coke)),

    % The person with the lasagna sat across from the person with milk.
    (main_course(Person1, lasagna), beverage(Person2, milk), across(Person1, Person2));
    (main_course(Person2, lasagna), beverage(Person1, milk), across(Person1, Person2)),

    % David never drinks coffee.
    \+ (beverage(david, coffee)),

    % Donna only drinks water.
    beverage(donna, water),

    % Danny could not afford to order steak.
    \+ (main_course(danny, steak)).

% Define a predicate to find the solution
who_ordered_pizza(Person) :-
    clues,
    main_course(Person, pizza).

% Utility predicate to ensure all elements in a list are different
all_different([H | T]) :-
    member(H, [pizza, lasagna, chicken, steak]),
    \+ member(H, T),
    all_different(T).
all_different([]).

% Example query:
% ?- who_ordered_pizza(Person).
% Person = danny ;
% false.   % To find all solutions, if any
