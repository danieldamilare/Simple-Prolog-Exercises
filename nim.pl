% A prolog program for the game of wythoff's Nim
player(max). player(min).
opp_player(X, Y) :- player(X), player(Y), \+ X = Y.

game_over([0, 0], p, q):- opp_player(p, q).

legal_move([X, Y], _, green(M), [X1, Y]) :- between(1, X, M), X1 is X - M.
legal_move([X, Y], _, red(M), [X, Y1]) :- between(1, Y, M), Y1 is Y - M.
legal_move([X, Y], _, both(M), [X1, Y1]) :- between(1, Y, M), between(1, X, M),  Y1 is Y - M, X1 is X -M.
