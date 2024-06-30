% solution(A, B, C, D, E) holds if A, B, C, D, E are colors
solution(A, B, C, D, E) :-
    color(A), color(B), color(C), color(D), color(E), 
    \+ A=B, \+ A=C, \+ A=D, \+ A=E, \+ B=C, \+ C=D, \+ D=E.

% The tree colors are these.
color(red).
color(white).
color(blue).


print_colors :-
    solution(A, B, C, D, E), nl,
    write('Country A is colored '), write(A), nl,
    write('Country B is colored '), write(B), nl,
    write('Country C is colored '), write(C), nl,
    write('Country D is colored '), write(D), nl,
    write('Country E is colored '), write(E), nl.

print_colors.
