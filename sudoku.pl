% A 4x4 sudoku solver
% The main predicate. Solve the puzzle and print the answer.

num(1). num(2). num(3). num(4).
uniq(P, Q, R, S) :-
num(P), num(Q), num(R), num(S),
\+ P = Q, \+ P = R, \+  P = S, \+ Q = R, \+ Q = S, \+ R = S.

sudoku(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3,
    C4, D1, D2, D3, D4) :-
    solution(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4),
    nl, write('A solution to this puzzle is '), nl,
    printrow(A1, A2, A3, A4), printrow(B1, B2, B3, B4),
    printrow(C1, C2, C3, C4), printrow(D1, D2, D3, D4).

printrow(P, Q, R, S) :- write('  '), write(P), write(' '),
    write(Q), write(' '), write(R), write(' '), write(S), nl.

solution(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3,
    C4, D1, D2, D3, D4) :-
    uniq(A1, A2, A3, A4), uniq(B1,B2, B3, B4), 
    uniq(C1, C2,C3, C4), uniq(D1, D2, D3, D4), 
    uniq(A1, B1, C1, D1), uniq(A2, B2, C2, D2),
    uniq(A3, B3, C3, D3), uniq(A4, B4, C4, D4),
    uniq(A1, A2, B1, B2), uniq(A3, A4, B3, B4),
    uniq(C1, C2, D1, D2), uniq(C3, C4, D3, D4).

