% A 2x3 version of the 15 puzzle by Noyes Chapman

initial_state([0, 1, 5, 4, 3, 2]).
goal_state([1, 2, 3, 4, 5, 0]).

legal_move([0, B, C,   X, E, F], up(X), [X, B, C,   0, E, F]).
legal_move([A, 0, C,   D, X, F], up(X), [A, X, C,   D, 0, F]).
legal_move([A, B, 0,   D, E, X], up(X), [A, B, X,   D, E, 0]).

legal_move(S1, down(X), S2) :- legal_move(S2, up(X), S1).

legal_move([0, X, C,  D, E, F], left(X), [X, 0, C,    D, E, F]).
legal_move([A, 0, X,  D, E, F], left(X), [A, X, 0,    D, E, F]).
legal_move([A, B, C,  0, X, F], left(X), [A, B, C,    X, 0, F]).
legal_move([A, B, C,  D, 0, X], left(X), [A, B, C,    D, X, 0]).
legal_move(S1, right(X), S2) :- legal_move(S2, left(X), S1).
