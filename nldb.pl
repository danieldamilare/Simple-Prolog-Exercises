person(john). person(george). person(mary). person(linda).
park(kew_beach). park(queens_park).
tree(tree01). tree(tree03). tree(tree02).
hat(hat01). hat(hat02). hat(hat03). hat(hat04).

sex(john, male). sex(george, male).
sex(mary, female). sex(linda, female).

color(hat01, red). color(hat02, blue).
color(hat03, red). color(hat04, blue).

in(john, kew_beach). in(george, kew_beach).
in(linda, queens_park). in(mary, queens_park).
in(tree01, queens_park). in(tree02, queens_park).
in(tree03, kew_beach).

beside(mary, linda). beside(linda, mary).

on(hat01, john). on(hat02, mary). on(hat03, linda). on(hat04, george).

size(john, small). size(george, big). 
size(mary, small). size(linda, big). 
size(hat01, small). size(hat02, small). 
size(hat03, big). size(hat04, big). 
size(tree01, big). size(tree02, small). size(tree03, small).


% prolog lexicon

article(a). article(the).

common_noun(park, X) :- park(X).
common_noun(tree, X) :- tree(X).
common_noun(hat, X) :- hat(X).
common_noun(man, X) :- person(X), sex(X, male).
common_noun(woman, X) :- person(X), sex(X, female).

adjective(big, X) :- size(X, big).
adjective(small, X) :- size(X, small).
adjective(red, X) :- color(X, red).
adjective(blue, X) :- color(X, blue).

preposition(on, X, Y) :- on(X, Y).
preposition(in, X, Y) :- in(X, Y).
preposition(beside, X, Y) :- beside(X, Y).
preposition(with, X, Y) :- on(Y, X).
preposition(with, X, Y) :- in(Y, X).
preposition(with, X, Y) :- beside(Y, X).

add_for_preposition(on, X, Y) :- assert(on(X, Y)).
add_for_preposition(in, X, Y) :- assert(in(X, Y)).
add_for_preposition(beside, X, Y) :- assert(beside(X, Y)), assert(beside(Y, X)).

proper_noun(X, X) :- \+ article(X), \+ common_noun(X, _),
                     \+ adjective(X, _), \+ preposition(X, _,_).



np([Name], X) :- proper_noun(Name, X).
np([Art|Rest], X) :- article(Art), np2(Rest, X).

np2([Adj|Rest], X) :- adjective(Adj, X), np2(Rest, X).
np2([Noun|Rest], X) :- common_noun(Noun, X), mods(Rest, X).

mods([], _).
mods(Words, X) :- 
    append(Start, End, Words),
    pp(Start, X),
    mods(End, X).

pp([Prep|Rest], X) :- preposition(Prep, X, Y), np(Rest, Y).


yes_no(String) :-
    split_words(String, Words), 
    yn(Words).

yn([is|Rest]) :-
    append(W1, W2, Rest),
    np(W1, Ref),
    np_or_pp(W2, Ref).

np_or_pp(W, Ref) :- np(W, Ref).
np_or_pp(W, Ref) :- pp(W, Ref).

simple_declarative(String) :-
    split_words(String, Words),
    sd(Words).

sd(Words) :-
    append(NP1, [is, Prep|NP2]),
    np(NP1, x)
    np(NP2, x)
    add_for_preposition(Prep, X, Y).
