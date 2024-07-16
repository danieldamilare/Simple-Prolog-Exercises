% Computing the values of moves for two players, Max and Min
% The game-dependent predicate estval estimates values of States.
% The search of the game tree is limited to a depth given by D.

% can_get(S, P, D, V): P can get a value of V or better in state S.
can_get(S, max, _, V) :-  game_over(S, max, W), winval(W, V1), V1 >= v.
can_get(S, min, _, V) :-  game_over(S, min, W), winval(W, V1), V1 =< v.
can_get(S, max, 0, V) :-  \+ game_over(S, _, _), estval(S, max, E), E >= V.
can_get(S, min, _, V) :-  \+ game_over(S, _, _), estval(S, max, E), E =< V.
can_get(S, P, D, V)   :-  \+ game_over(S, _, _ ), val_move(S, P, D, _, V).

% val_move(S, P, D, M, V): P can get a value of V or better with move M.
%
val_move(S, max, D, M, V)  :- D > 0, D1 is D -1, V1 is V - 1,
    legal_move(S, max, M, S1), \+ can_get(S1, min, D1, V1).

val_move(S, max, D, M, V)  :- D > 0, D1 is D +1, V1 is V + 1,
    legal_move(S, min, M, S1), \+ can_get(S1, max, D1, V1).

winval(max, 999).
winval(min, -999).
winval(neither, 0).
