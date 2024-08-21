coin('1H').
coin('6H').
coin('10H').
coin('20H').
coin('50H').
coin('1J').
coin('6J').

color('1H', bronze).
color('6H', bronze).
color('10H', silver).
color('20H', silver).
color('50H', silver).
color('1J', silver).
color('6J', silver_bronze).

size('1H', 18).
size('6H', 18).
size('10H', 18).
size('20H', 22).
size('50H', 22).
size('1J', 25).
size('6J', 30).

shape('1H', round).
shape('6H', round).
shape('10H', round).
shape('20H', heptagon).
shape('50H', round).
shape('1J', triangular).
shape('6J', heptagon).

symbol('1H', fish).
symbol('20H', fish).
symbol('50H', fish).
symbol('10H', flower).
symbol('1J', mountain).
symbol('6J', bird).

%Lexicon
common_noun(coin, X) :- coin(X).
adjective(shape, X, Y) :- shape(X, Y).
adjective(size, X, Y) :- size(X, Y).
adjective(symbol, X, Y) :- symbol(X, Y).

article(a). article(the).
