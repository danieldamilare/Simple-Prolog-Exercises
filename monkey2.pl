% An extension of the monkey banana problem
% In this extension, the monkey cannot reach the banana even if he is on the bodx
% However, there is a big stick located in a corner of the room that can be used
% to knock down the bananas when the monkey has the stick and he is on the box 
% under the banans. The monkey can pick or drop the stick, and can climb the box
% while holding the stick. But the stick is bulky, and he can only push the box when
% he is not carrying the stick.
%
% state are represented with list [b, m, l, o, h, s, c]: 
% b represent the location of the banana, m: monkey location, l: box location
% o: either y or n according to whether the monkey is on the box.
% h : either y or n according to hether the monkey has the bananas.
% s represent the location of the stick, % c: either y or n according to whether the monkey is carrying the stick.
%
initial_state([loc1, loc2, loc3, n, n, loc4, n]).

goal_state([_, _, _, _,  y, _, _]).

legal_move([M, M, M, y, n, M, y], swing_stick, [M, M, M, y, y, M, y]).

legal_move([B, S, L, n, n, S, n], pick_up_stick, [B, S, L, n, n, S, y]).
legal_move(S1, drop_stick, S2) :- legal_move(S2, pick_up_stick, S1).

legal_move([B, _, L, n, n, S, n], go(X), [B, X, L, n, n, S, n]).

legal_move([B, M, L, n, n, M, y], go(X), [B, X, L, n, n, X, y]).

legal_move([B, M, M, n, n, S, n], push(X), [B, X, X, n, n, S, n]).

legal_move([B, M, M, n, n, S, n], climb_on, [B, M, M, y, n, S, n]).

legal_move([B, M, M, n, n, M, y], climb_on, [B, M, M, y, n, M, y]).

legal_move([B, M, M, y, n, M, y], climb_off, [B, M, M, n, n, M, y]).

legal_move([B, M, M, y, n, S, n], climb_off, [B, M, M, n, n, S, n]).


