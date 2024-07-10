% play_user(U): play entiere game, getting moves for U from terminal.
play_user(U) :-
    initial_state(S, P), write('The first player is '), write(P),
    write(' and the initial state is '), write_state(S),
    play_from(S, P, U).

% play_from(S, P, U) ; player P plays from state S with user U.
play_from(S, P, _) :-
    game_over(S, P, W), write('---- The winner is '), write(W).

play_from(S, P, U) :-
    opp(P, Q), get_move(S, P, M, U),  legal_move(S, P, M, New), 
    write('Player '), write(P), write(' choose move '), write(M), 
    write(' and the new state is '), write_state(New),
    play_from(New, Q, U).

write_state(S) :- nl, write('   '), write(S), nl.

get_move(S, P, M, U) :- \+ P = U, win_move(S, P, M).
get_move(S, P, M, U) :- \+ P = U, tie_move(S, P, M).
get_move(S, P, M, U) :- \+ P = U, legal_move(S, P, M, _).
get_move(_, P, M, P) :- write('Enter User move( then a period ): '), read(M).

