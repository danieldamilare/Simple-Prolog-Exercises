% Formulating the monkey banana problem as a planning problem using prolog
% The bananas, monkey, and box are at different locations.
% The monkey is not on the box and has no bananas.
% The list [b, m, l, o, h] represent the states of the problem
% b represent the location of the banana, m: monkey location, l: box location
% o: either y or n according to whether the monkey is on the box.
% h : either y or n according to hether the monkey has the bananas.

% initial_state([loc1, loc2, loc3, n, n]). 

% % The goal is any state where the monkey has the bananas.
% goal_state([loc2, loc2, loc3, n,  y]).

% % Climbing on the box causees the monkey to be on the box
% legal_move([B, M, M, n, H], climb_on, [B, M, M, y, H]).
% % Climbing off the box causes the monkey to be off the box
% legal_move([B, M, M, y, H], climb_off, [B, M, M, n, H]).
% % Grabbing the bananas causes the moneky to have the banans
% legal_move([B, B, B, y, n], grab, [B,B,B,y, y]).
% % Pushing the box changes where the monkey and box are
% legal_move([B, M, M, n, n], push(X), [B, X, X, n, n]).
% legal_move([M, M, M, n, y], push(X), [X, X, X, n, y]).
% % Going to a location changes where the monkey is.
% legal_move([B, _, L, n, n], go(X), [B, X, L, n, n]).
% legal_move([M, M, L, n, y], go(X), [X, X, L, n, y]).

% Situation and fluent

location(box, loc3, []).
location(box, L, [push(L)|_]).
location(box, L, [A|S]) :- \+ A = push(_), location(box, L, S).

% fluent for monkey
location(monkey, loc2, []).
location(monkey, L, [push(L)|_]).
location(monkey, L, [go(L)|_]).
location(monkey, L, [A|S]) :- \+ A = go(_), \+ A = go(_), location(monkey, L, S).

location(banana, loc1, _).
% location(banana, L,  S) :- has_bananas(S), location(monkey, L, S).

on_box([climb_on|_]).
on_box([A|S]) :- \+ A = climb_off, on_box(S).

has_bananas([grab|_]).
has_bananas([H|T]) :- \+ H = grab,  has_bananas(T).

% precondition 
poss(climb_off, S) :- on_box(S).
poss(go(_), S) :- \+ on_box(S).
poss(grab, S) :-   on_box(S),  location(monkey, L, S), location(banana, L, S).

poss(push(_), S) :- poss(climb_on, S).
poss(climb_on, S) :- \+ on_box(S), location(monkey, L, S), location(box, L, S). 

%planning with situation and fluents.
%
initial_state([]). % Initial state is always [], since we are starting with an empty 
legal_move(S, A, [A|S]) :- poss(A, S).
goal_state(S) :- has_bananas(S).
