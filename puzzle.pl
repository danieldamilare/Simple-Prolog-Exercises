% prolog proram to solve the cryptarithmetic puzzle CROSS + ROADS = DANGER.


num(0). num(1). num(2). num(3). num(4). num(5).
num(6). num(7). num(8). num(9).

uniq_num(C, R, O, S, A, D, N, G, E) :-
    num(C), num(R), \+ C = R, num(O),
    \+ C = O, \+ R = O, num(S), \+ C = S,

    \+ R = S, \+ O = S, num(A), \+ C = A,
    \+ R = A, \+ O = A, \+ S = A, num(D), \+ C = D,
    \+ R = D, \+ O = D, \+ S = D, \+ A = D, 
    num(N), \+ C = N, \+ R = N, \+ O = N, \+ S = N, 
    \+ A = N, \+ D = N, num(G), \+ C = G, \+ R = G,
    \+ O = G, \+ S = G, \+ A = G, \+ D = G, \+ N = G,
    num(E), \+ C = E,\+ R= E, \+ O = E, \+ S = E,
    \+ A = E, \+ D = E, \+ N = E, \+ G = E.

solution(C, R, O, S, A, D, N, G, E) :-
    num(S),
    R is (S + S) mod 10, C1 is (S + S) // 10,
    R > 0, 
    num(D), D > 0, \+ D = S,
    E is (S + D + C1) mod 10, C10 is (S + D + C1) // 10,
    num(O), num(A), \+ O = D,  \+ A = D, \+ O = R,
    \+ A = R, \+ A = E, \+ O = E,
    G is (O+ A + C10) mod 10, C100 is (O+A+C10) //10,
    N is (R + O + C100) mod 10, C1000 is (R + O + C100) // 10,
    num(C), C > 0, \+ C = S, \+ C = D, \+ C = O, \+ C = A,
    \+ C = R,
    A is (C + R + C1000) mod 10, D is (C + R + C1000) // 10,
    uniq_num(C, R, O, S, A, D, N, G, E).


