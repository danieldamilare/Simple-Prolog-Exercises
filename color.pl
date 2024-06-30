% Define the basic on/2 relationships
on(red, dark).
on(dark, white).
on(white, green).
on(green, blue).
on(blue, yellow).
on(yellow, red).
on(red, black).
on(black, green).

% Define has_red_on_green/2 to find if there's any red directly on top of green
has_red_on_green(X, Y) :- on(X, Y).
has_red_on_green(X, Y) :- on(X, Z), has_red_on_green(Z, Y).
has_red_on_green(X, Y) :- on(Y, Z), has_red_on_green(X, Z).
print_colors :-
    solution(A, B, C, D, E), nl,
    write('Country A is colored '), write(A), nl,
    write('Country B is colored '), write(B), nl,
    write('Country C is colored '), write(A), nl,
    write('Country D is colored '), write(B), nl,
    write('Country E is colored '), write(A), nl.
print_colors.
