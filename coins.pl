% The three-coins problem formulated for the general planner
% Imagine coins arranged with heads and tails. eg H, H, T. Make them 
% all the same (that is, either all heads or all tails) using exactly
% three moves. A move here means turning over one of the coin (so that
% a head becomes a tail and a tail becomes a head).

initial_state([h, h, t]).

goal_state([h, h, h]).
goal_state([t, t, t]).

% The three possible moves. Each change one of the coins

legal_move([X, Y, Z], flip_left, [X1, Y, Z]) :- opposite(X, X1).
legal_move([X, Y, Z], flip_middle, [X, Y1, Z]) :- opposite(Y, Y1).
legal_move([X, Y, Z], flip_right, [X, Y, Z1]) :- opposite(Z, Z1).

opposite(h, t).    % Flipping a head gives a tail
opposite(t, h).    % Flipping a tail gives a head
