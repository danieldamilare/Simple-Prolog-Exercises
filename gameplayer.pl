% This general game player needs these predicates to be defined:
% - player(Player)
% - game_over(State,Player,Winner)
% - legal_move(BeforeState,Player,Move,AfterState)
% label(S,P,W): state S with player P to move is labeled winner W.
label(S,P,W) :- game_over(S,P,W).
label(S,P,P) :- win_move(S,P,_).
label(S,P,neither) :- \+ win_move(S,P,_), tie_move(S,P,_).
label(S,P,Q) :- opp(P,Q), \+ tie_move(S,P,_), \+ game_over(S,P,_).
% win_move(S,P,M): P can win by making move M.
win_move(S, P, M) :- \+ game_over(S,P,_), opp(P,Q),
legal_move(S,P,M,New), label(New,Q,P).
% tie_move(S,P,M): P can avoid losing by making move M.
tie_move(S,P,M) :- \+ game_over(S,P,_), opp(P,Q),
legal_move(S,P,M,New), \+ label(New,Q,Q).
opp(P,Q) :- player(P), player(Q), \+ P=Q.
