% Dark Tv series Family tree

child(helge_dopler, greta_dopler).
child(helge_dopler, bernd_dopler).
child(peter_dopler, helge_dopler).
child(elisabeth, charlotte).
child(elisabeth, peter_dopler).
child(franziska, peter_dopler).
child(franziska, charlotte).
child(eric, franziska).
child(eric, magnus).
child(claudia_tiedemann, doris_tiedemann).
child(claudia_tiedemann, egon_tiedemann).
child(regina_tiedemann, claudia_tiedemann).
child(bartosz_tiederman, regina_tiedemann).
child(bartosz_tiederman, aleksander_tiedemann).
child(sija, hannah).
child(sija, egon_tiedemann).
child(daniel_kahnwald, ines_kahnwald).
child(jonas, hannah).
child(jonas, michael).
child(tronte_neilsen, agnes_neilsen).
child(mads, tronte_neilsen).
child(mads, jana_neilsen).
child(ulrich, tronte_neilsen).
child(ulrich, jana_neilsen).
child(katharina, helene).
child(michael, ulrich).
child(michael, katharina).
child(martha, katharina).
child(martha, ulrich).
child(magnus, ulrich).
child(magnus, katharina).
child(noah, sija).
child(noah, bartosz_tiederman).
child(charlotte, elisabeth).
child(charlotte, noah).
child(erik_obendorf, jurgen_obendorf).
child(erik_obendorf, ulla_obendorf).

male(bernd_dopler).
male(helge_dopler).
male(egon_tiedemann).
male(daniel_kahnwald).
male(tronte_neilsen).
male(peter_dopler).
male(aleksander_tiedemann).
male(ulrich).
male(mads).
male(bartosz_tiederman).
male(jonas).
male(michael).
male(magnus).
male(noah).

female(greta_dopler).
female(doris_tiedemann).
female(claudia_tiedemann).
female(sija).
female(ines_kahnwald).
female(agnes_neilsen).
female(jana_neilsen).
female(helene).
female(charlotte).
female(regina_tiedemann).
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
great_grand_mother(X, Y) :- mother(X, Z), grand_parent(Z, Y).
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
