% Dark Tv series Family tree

child("helge dopler", "greta dopler").
child("helge dopler", "bernd dopler").
child("peter dopler", "helge dopler").
child(elisabeth, charlotte).
child(elisabeth, "peter dopler").
child(franziska, "peter dopler").
child(franziska, charlotte).
child(eric, franziska).
child(eric, magnus).
child("claudia tiedemann", "doris tiedemann").
child("claudia tiedemann", "egon tiedemann").
child("regina tiedemann", "claudia tiedemann").
child("bartosz tiederman", "regina tiedemann").
child("bartosz tiederman", "aleksander tiedemann").
child(sija, hannah).
child(sija, "egon tiedemann").
child("daniel kahnwald", "ines kahnwald").
child(jonas, hannah).
child(jonas, michael).
child("tronte neilsen", "agnes neilsen").
child(mads, "tronte neilsen").
child(mads, "jana neilsen").
child(ulrich, "tronte neilsen").
child(ulrich, "jana neilsen").
child(katharina, helene).
child(michael, ulrich).
child(michael, katharina).
child(martha, katharina).
child(martha, ulrich).
child(magnus, ulrich).
child(magnus, katharina).
child(noah, sija).
child(noah, "bartosz tiederman").
child(charlotte, elisabeth).
child(charlotte, noah).
child("erik obendorf", "jurgen obendorf").
child("erik obendorf", "ulla obendorf").

male("bernd dopler").
male("helge dopler").
male("egon tiedemann").
male("daniel kahnwald").
male("tronte neilsen").
male("peter dopler").
male("aleksander tiedemann").
male(ulrich).
male(mads).
male("bartosz tiederman").
male(jonas).
male(michael).
male(magnus).
male(noah).

female("greta dopler").
female("doris tiedemann").
female("claudia tiedemann").
female(sija).
female("ines kahnwald").
female("agnes neilsen").
female("jana neilsen").
female(helene).
female(charlotte).
female("regina tiedemann").
female(hannah).
female(katharina).
female(martha).
female(elisabeth).
female(franziska).


parent(X, Y) :- child(Y, X).
father(X, Y) :- male(X), child(Y, X).
mother(X, Y) :- female(X), child(Y, X).
grand_parent(X, Y) :- parent(X, Z), parent(Z, Y).
grand_father(X, Y) :- father(X, Z), parent(Z, Y).
grand_mother(X, Y) :- mother(X, Z), grand_parent(Z, Y).
sibling(X, Y) :- \+ X= Y, parent(Z, X), parent(Z, Y).
brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).
full_sibling(X, Y) :- parent(Z, X), parent(Z, Y), parent(T, X), parent(T, Y), \+ T=Z.
half_sibling(X, Y) :- sibling(X, Y), parent(Z, X), parent(T, Y), \+ T= Y.
first_cousin(X, Y) :- parent(Z, X), parent(T, Y), \+ Z = T, sibling(Z, T).
second_cousin(X, Y) :- parent(Z, X), parent(T, Y), \+ T = Z, first_cousin(T, Z).
half_first_cousin(X, Y) :- parent(Z, X), parent(T, Y), \+ Z = T, half_sibling(Z, T).
cousin(X, Y) :- first_cousin(X, Y).
cousin(X, Y) :- parent(Z, X), parent(T, Y), \+ T = Z, cousin(Z, T).

descendant(X, Y) :- child(X, Y).
descendant(X, Y) :- child(Z, Y), descendant(X, Z).
% common_ancestor(Y, Z) :- parent(V, Y), parent(W, Z), V=W.
% closest_common_ancestor(X, Y, Z) :- 

ancestor(X, Y) :- descendant(Y, X).
write_child(X, Y) :-
    write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X, Y) :- child(X, Y), write_child(X, Y).
write_descendant_chain(X, Y) :- child(Z, Y), write_descendant_chain(X, Z), write_child(Z, Y).


% prolog lexicon

article(a). article(the). article(and).

common_noun(child, X, Y) :- child(X, Y).
common_noun(male, X, _) :- male(X).
common_noun(female, X, _) :- female(X).
common_noun(son, X, Y) :- male(X), child(X, Y).
common_noun(daughter, X, Y) :- female(X), child(X, Y).
common_noun(father, X, Y) :- father(X, Y).
common_noun(mother, X, Y) :- mother(X, Y).
common_noun(parent, X, Y) :- parent(X, Y).
common_noun(brother, X, Y) :- brother(X, Y).
common_noun(sister, X, Y) :- sister(X, Y).
common_noun(brother, X, Y) :- brother(X, Y).
common_noun(cousin, X, Y) :- first_cousin(X, Y).
common_noun(ancestor, X, Y) :- ancestor(X, Y).
common_noun(descendant, X, Y) :- ancestor(X, Y).
common_noun("grand parent", X, Y) :- grand_parent(X, Y).
common_noun("grand father", X, Y) :- grand_father(X, Y).
common_noun("grand mother", X, Y) :- grand_mother(X, Y).
common_noun("grand daughter", X, Y) :- female(X), grand_parent(Y, X).
common_noun("grand son", X, Y) :- male(X), grand_parent(Y, X).
common_noun("grand child", X, Y) :- grand_parent(Y, X).

preposition(of).
proper_noun(X, X) :- \+ article(X), \+ preposition(X), \+ common_noun(X, _, _).

np([Name], X)  :- proper_noun(Name, X).
np([Article, Noun | Rest], X) :- 
    article(Article), 
    common_noun(Noun, X, Y),
    pp(Rest, Y).

pp([Prep|Rest], Y) :-
    preposition(Prep),
    np(Rest, Y).

ask_question([who | Question], X) :- wh(Question, X).

ask_question([is | Question], X) :- yn(Question).

wh([is | Question], X) :- np(Question, X).

yn(Question) :-
    append(Start, End, Question),
    np(Start, X),
    np(End, X).

