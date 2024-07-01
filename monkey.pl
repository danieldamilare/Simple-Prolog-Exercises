% Formulating the monkey banana problem as a planning problem using prolog
% The bananas, monkey, and box are at different locations.
% The monkey is not on the box and has no bananas.
% The list [b, m, l, o, h] represent the states of the problem
% b represent the location of the banana, m: monkey location, l: box location
% o: either y or n according to whether the monkey is on the box.
% h : either y or n according to hether the monkey has the bananas.

initial_state([loc1, loc2, loc3, n, n]). 

% The goal is any state where the monkey has the bananas.
goal_state([_, _, _, _,  y]).

% Climbing on the box causees the monkey to be on the box
legal_move([B, M, M, n, H], climb_on, [B, M, M, y, H]).
% Climbing off the box causes the monkey to be off the box
legal_move([B, M, M, y, H], climb_off, [B, M, M, n, H]).
% Grabbing the bananas causes the moneky to have the banans
legal_move([B, B, B, y, n], grab, [B,B,B,y, y]).
% Pushing the box changes where the monkey and box are
legal_move([B, M, M, n, H], push(X), [B, X, X, n, H]).
% Going to a location changes where the monkey is.
legal_move([B, _, L, n, H], go(X), [B, X, L, n,H]).
