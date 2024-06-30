:-  dynamic located_on/2.

block(blockA). block(blockB).
block(blockC). block(blockD).
block(blockE). block(blockF).
block(blockG).

color(blockA, red). color(blockE, yellow).
color(blockB, green). color(blockF, white).
color(blockC, blue). color(blockG, black).
color(blockD, green).

size(blockA, big). size(blockB, small).
size(blockC, medium). size(blockD, big).
size(blockE, medium). size(blockF, small).
size(blockG, big).

shape(blockA, triangle). shape(blockB, square).
shape(blockC, cube). shape(blockD, pyramid).
shape(blockE, rectangle). shape(blockF, wedge).
shape(blockE, circular).

area(area1). area(area2). area(area3). area(area4). area(area5).

located_on(blockA, blockB).
located_on(blockB, area).
located_on(blockC, blockE).
located_on(blockD, blockC).
located_on(blockE, area).
located_on(blockF, area).
located_on(blockG, area).

put_on(Block1, Block2) :- 
    block(Block1), block(Block2),
    \+located_on(_, Block1),
    \+located_on(_, Block2),
    retract(located_on(Block1, X)),
    assert(located_on(Block1, Block2)).


left(area, area). left(area, area).
left(area, area). left(area, area).

area_left_of(X, Y) :- left(X, Y).
area_left_of(X, Y) :-  left(Z, Y), area_left_of(X, Z).

above(X, Y) :- located_on(X, Y).
above(X, Y) :- located_on(X, Z), above(Z, Y).

beside(X, Y) :- above(X, Z), area(Z), above(Y, W), area(W), left(Z, W).
beside(X, Y) :- above(X, Z), area(Z), above(Y, W), area(W), left(W, Z).

article(a). article(the). article(any).

common_noun(block, X) :- block(X).
common_noun(area, X) :- area(X).
common_noun(triangle, X) :- block(X), shape(X, triangle).
common_noun(rectangle, X) :- block(X), shape(X, rectangle).
common_noun(square, X) :- block(X), shape(X, square).
common_noun(cube, X) :- block(X), shape(X, cube).
common_noun(pyramid, X) :- block(X), shape(X, pyramid).
common_noun(wedge, X) :- block(X), shape(X, wedge).
common_noun(circular, X) :- block(X), shape(X, circular).


adjective(small, X) :- size(X, small).
adjective(big, X) :- size(X, big).
adjective(medium, X) :- size(X, medium).
adjective(white, X) :- color(X, white).
adjective(blue, X) :- color(X, blue).
adjective(red, X) :- color(X, red).
adjective(black, X) :- color(X, black).
adjective(yellow, X) :- color(X, yellow).
adjective(green, X) :- color(X, green).

preposition(beside, X, Y) :- beside(X, Y).
preposition(on, X, Y) :- above(X, Y).
preposition(above, X, Y) :- above(X, Y).
preposition(below, X, Y) :- above(Y, X).

proper_noun(X, X) :- \+ article(X), \+ adjective(X, _), \+ preposition(X, _, _).

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

sd([put|Word]) :-
    append(NP1, [on|NP2], Word),
    np(NP1, X),
    np(NP2, Y),
    put_on(X, Y).
