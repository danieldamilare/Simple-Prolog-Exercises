player(x). player(o).

initial_state([o, o, -, -, -, -, -, -, -], x).

game_over(S, _, Q) :- three_in_row(S, Q).
game_over(S, _, neither) :- \+ legal_move(S, _, _, _).

num(1). num(2). num(3). num(4). num(5). num(6). num(7). num(8). num(9).

three_in_row([P, P, P, _, _, _, _, _, _], P):- player(P).
three_in_row([_,_, _, P, P, P, _, _, _], P) :- player(P).
three_in_row([_,_, _, _, _, _, P, P, P], P) :- player(P).
three_in_row([P,_, _, P, _, _, P, _, _], P) :- player(P).
three_in_row([_,P, _, _, P, _, _, P, _], P) :- player(P).
three_in_row([_,_, P, _, _, P, _, _, P], P) :- player(P).
three_in_row([_,_, P, _, P, _, P, _, _], P) :- player(P).
three_in_row([P,_, _, _, P, _, _, _, P], P) :- player(P).

legal_move([-|T], P, 1, [P|T]).
legal_move([H|T], P, X, [H|Y]):- num(X), \+ X = 1, X2 is X -1, legal_move(T, P, X2, Y).

