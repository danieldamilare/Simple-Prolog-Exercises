% sorting function in prolog

% selection sort

min(H, [H]).
min(X, [H|T]) :- min(Y, T), H =< Y, X is H.
min(X, [H|T]) :- min(Y, T), H > Y, X is Y.
remove_elem(_, [], []).
remove_elem(X, [X|T], T).
remove_elem(X, [H|T], [H|Rest]) :-
    \+ X = H,
    remove_elem(X, T, Rest).

selection_sort([], []).
selection_sort([H|T], [H2|T2]) :-
    min(H2, [H|T]), remove_elem(H2, [H|T], Rest),
    selection_sort(Rest, T2).

% insert/3 - Inserts an element into a sorted list.
insert(X, [], [X]).
insert(X, [H|T], [X, H|T]) :- X =< H.
insert(X, [H|T], [H|T2]) :- X > H, insert(X, T, T2).

% insertion_sort/2 - Sorts a list using insertion sort.
insertion_sort([], []).
insertion_sort([H|T], Sorted) :-
    insertion_sort(T, SortedTail),
    insert(H, SortedTail, Sorted).

insert_into(X, 0, L, [X|L]).
insert_into(X, N, [H|T], [H|T2]) :- length([H|T], Length), N < Length,  M is N-1, insert_into(X, M, T, T2).

elem3(X, [X]).
elem3(X, [_|L]) :- elem3(X, L).

just_before(X, Y, List) :- append(_, [X, Y | _], List).

exactly_3([X, Y, Z| []]).
exactly_3_up(List) :- count_elem(List, 3).

at_least_3([X, Y, Z | T]).
at_least_3_up(List) :- count_elem(List, X), X>3.

at_most_3([]).
at_most_3([X]).
at_most_3([X, Y]).
at_most_3([X, Y, Z]).

at_most_3_up(L) :- count_elem(List, X), X < 3.

count_elem([], 0).
count_elem([H|T], L):- count_elem(T, L1), L is L1+1.

intersect(X, Y):- member(L, X), member(L, Y).

all_intersect([], Y).
all_intersect([H|T], Y) :- intersect(H, Y), all_intersect(T, Y).

p(X) :-q(X,[],X).
q([],Y,Y).
q([E|L],Y,Z) :- q(L,[E|Y],Z).
