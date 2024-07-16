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

% Line L is available and is the last of square not yet drawn
last_avail_line(L, Sq, St) :-
    avail_line(L, Sq, St), \+ avail_line(_, Sq, [draw(_, L) | St]).

% Line L is from Sq and not yet drawn in state St
avail_line(L, Sq, St) :- 
    square_lines(Sq, Ls), member(L, Ls), \+ member(draw(_, L), St).

% The legal moves
legal_move(St, P, [L], [draw(P, L) | St]) :- 
    avail_line(L, _, St).

legal_move(St, P, [L|Rest], New) :-
    last_avail_line(L, _, St), legal_move([draw(P, L)|St], P, Rest, New).

