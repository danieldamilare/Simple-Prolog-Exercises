% A logic puzzle involving jobs and musical instruments
solution(Flute) :-
    %Distinct occupations and instruments
    uniq_people(Doctor, Lawyer, Engineer),
    uniq_people(Piano, Violin, Flute),
    spouses(Chris_spouse, Sandy_spouse, Pat_spouse),
    Chris_spouse = Doctor,
    Lawyer = Piano,
    \+ Pat_spouse = Engineer,
    Violin = Doctor,
    \+ sandy = Violin.

uniq_people(A, B, C) :- person(A), person(B), \+ A=B, person(C), \+ A=C, \+B=C.

person(chris).
person(sandy).
person(pat).

person_list([]).
person_list([H|T]):- person(H), person_list(T).

elem(X, [X |_]).
elem(X, [_|L]) :-  elem(X, L).

uniq_people_list([]).
uniq_people_list([H|T]) :- person(H), \+ elem(H, T), uniq_people_list(T).

uniq_people_list2([]).
uniq_people_list2([H|T]) :- uniq_people_list(T), person(H), \+ elem(H, T) .

join([], L, L).
join([H|T], L, [H|Z]) :- join(T, L, Z).

spouses(none, none, none).
spouses(sandy, chris, none).
spouses(pat, none, chris).
spouses(none, pat, sandy).
