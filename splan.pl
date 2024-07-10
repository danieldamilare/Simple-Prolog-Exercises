% A staged planner in Prolog
% This staged planner needs  the predicates below to be defined.
%    - legal_move(BeforeState, Move, AfterState).
%    - initial_state(State)
%    - stages(ListofStages)
%    - goal_stage(Stage, State).

% plan(L) : L is a list of moves through a list of goal stages.
plan(L) :- initial_state(I), stages([G|GL]), plan_all(G, I, L, GL).

% plan_all(G, S, L, GL) : L passes from G through each stage in GL
%
plan_all(_, _, [], []).
plan_all(G1, S1, L, [G2|GL]) :- 
    append(L1, L2, L), reach(G1, S1, L1, G2, S2), plan_all(G2, S2, L2, GL).

% reach(G1, S1, L, G2, S2) : L moves from S1 in G1 to S2 in G2.
reach(_, S, [], G2, S) :- goal_stage(G2, S).

reach(G1, S1, [M|L], G2, S3) :- 
    legal_move(S1, M, S2), goal_stage(G1, S2), reach(G1, S2, L, G2, S3).
