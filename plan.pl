% This general planner needs the predicates below to be defined:
% - legal_move(BeforeState, Move, AfterState).
% - initial_state(State).
% -  goal_state(State).

%plan(L) : L is a list of moves from the inital state to the goal state.
%
%
bplan(L, N)  :- tryplan([], L, N).
% tryplan(X, L) : L is a plan and has X as its final elements.
tryplan(L, L, N) :- plan(L).
tryplan(X, L, N) :- \+ N = 0, N1 is N-1, tryplan([_|X], L, N1).

plan(L) :- initial_state(I), goal_state(G), reachable(I, L, G).

% reachable(S1, L, S2) : S2 is reachable from S1 using moves L
reachable(S, [], S).

reachable(S1, [M|L], S3) :-legal_move(S1, M, S2), reachable(S2, L, S3). 
