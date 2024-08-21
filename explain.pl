% This program uses three predicates defined elsewhere:
% est - the procedure that establishes a query
% background - the background knowledge to be used
% assumable - an atom that can be used in an explanation
% explain(Q,E): Q can be established if E is added to background KB.
explain(Q,E) :- background(K), merge(E,K,K1), est(K1,Q).
% merge(E,K,K1): adding the atoms E as atomic clauses to K produces K1.
merge([],K,K).
merge([A|E],K,[[A]|K1]) :-
    merge(E,K,K1), assumable(A), \+ member(A,E).
