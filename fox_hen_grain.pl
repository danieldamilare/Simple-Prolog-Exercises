% prolog planner for the fox hen and grain problem
% In his yard, a farmer has a fox, a hen, and a bushel of grain. The
% farmer must transfer all these things to a stall at the market, using only 
% a cart which can carry at most one of them (plus himself) at a time. The problem
% is that if the farmer leaves the fox unattended with the hen, it will eat the hen. Similarly, if the hen is left unatttended with the grain, it will eat the grain. 
% Is there a way for the farmer(without helpers) to tranfer all the three items to 
% market without any of them getting eaten?
%
% solution
% A state of the problem is reperesented by a list [fox, hen, grain, cart] each containing the location (either market or yard) of the element.. 
%

opp(yard, market).
opp(market, yard).

unsafe_state([X, X, _, Z]):- \+ X = Z.
unsafe_state([_, Y, Y, Z]):- \+ Y = Z.

safe_state(S):- \+ unsafe_state(S).

legal_move([P, Q, R, S], go_alone(X), [P, Q, R, X]) :- opp(S, X), safe_state([P, Q, R, X]).
legal_move([P, Q, R, P], go_with(fox, X), [X, Q, R, X]) :- opp(P, X), safe_state([X, Q, R, X]).
legal_move([P, Q, R, Q], go_with(hen, X), [P, X, R, X]) :- opp(Q, X), safe_state([P, X, R, X]).
legal_move([P, Q, R, R], go_with(grain, X), [P, Q, X, X]) :- opp(R, X), safe_state([P, Q, X, X]).

initial_state([yard, yard, yard, yard]).
goal_state([market, market, market, market]).
