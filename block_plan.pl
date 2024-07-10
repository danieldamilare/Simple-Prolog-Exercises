% A planner for a block world

%fluent
area(area1).
area(area2).
area(area3).
block(a).
block(b).
block(c).
block(d).
located_on(b, c, []).
located_on(c, area1, []).
located_on(a, b, []).
located_on(d, area3, []).

located_on(a, X, [move(a, X) | _]).
located_on(b, X, [move(b, X) | _]).
located_on(c, X, [move(c, X) | _]).

located_on(a, Loc, [A|T]):- located_on(a, Loc, T), \+ A = move(a, _).
located_on(b, Loc, [A|T]):- located_on(b, Loc, T), \+ A = move(b, _).
located_on(c, Loc, [A|T]):- located_on(c, Loc, T), \+ A = move(c, _).

% done(S) :- located_on(a, b, S), located_on(b, d, S), located_on(c, area1, S), located_on(d, area3, S).

poss(move(X, Y), S) :- block(X), block(Y), \+ X = Y, \+ located_on(_, X, S), \+ located_on(_, Y, S).
poss(move(X, Y), S) :- block(X), area(Y), \+ located_on(_, Y, S), \+ located_on(_, X, S).

goal_state([_, move(b, d), ]).
initial_state([]).
legal_move(S, A, [A|S]) :- poss(A, S).
