%A prolog game for the boxes game
player(max). player(min).

square_lines(sq1, [1, 3, 4, 6]).
square_lines(sq2, [2, 4, 5, 7]).
square_lines(sq3, [6, 8, 9, 10]).

initial_state([], max).

game_over(St, _, W) :-
    owns(W, Sq1, St),  owns(W, Sq2, St), \+ Sq2 = Sq1.

%Player P owns Sq if just drew last line or owned sq before
owns(P, Sq, [draw(P, L)| St]) :- last_avail_line(L, Sq, St).
owns(P, Sq, [_| St]) :- owns(P, Sq, St).

