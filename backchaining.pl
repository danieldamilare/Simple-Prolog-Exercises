% est(K, Q): query Q can be established from knowledge base K.

est(_,[]). % No query atoms
est(K,[eq(X,X)|T]) :- est(K,T). % Equality.
est(K,[not(A)|T]) :- \+ est(K,[A]), est(K,T). % Negation.
est(K,[A|T]) :- member_copy([A|B],K), append(B,T,Q), est(K,Q).
% member_copy(X,L): X is an atomic element of L or a copy otherwise.
member_copy(X,L) :- member(X,L), X=[_].
member_copy(X,L) :- member(E,L), \+ E=[_], copy_term(E,X).

estbf(_, []).
estbf(K, [H|T]):- member([H|B], K), append(T, B, Q), est(K, Q).

% estfc(K,Q) holds if query Q can be established from knowledge base K.
% The method is forward-chaining.
estfc(K, Q) :- allsolved(K, Q).
estfc(K, Q) :- nkb(K, K1), estfc(K1, Q).

allsolved(_, []).
allsolved(K, [A|Q]) :- solved(K, A), allsolved(K, Q).
solved(K, A) :- member([A], K).
nkb(K, [[A]| K]) :- member([A|B], K), \+ solved(K, A), allsolved(K, B).
