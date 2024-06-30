% P1, P2, P3, P4, P5 are five distinct available periods.
uniq_periods(P1, P2, P3, P4, P5) :-
    per(P1), per(P2), per(P3), per(P4), per(P5), 
    \+ P1 = P2, \+ P1 = P3, \+ P1 = P4, \+ P1 = P5, 
    \+ P2 = P3, \+ P2 = P4, \+ P2 = P5, \+ P3 = P4, 
    \+ P3 = P5, \+ P4 = P5. 

per(P) :- day(D), time(T), P is 100 * D+T, \+ taken(P).

day(1). day(2). day(3). day(4). day(5).

time(9). time(10). time(11). time(12).
time(13). time(14). time(15). time(16).

seq(A, B):- A =:= B-1.
seq(A, B):- A =:= B+1.

not_2_in_a_row(P1, P2, P3, P4, P5) :-
    \+ seq(P1, P2), \+ seq(P1, P3), \+ seq(P1, P4), \+ seq(P1, P5), 
    \+ seq(P2, P3), \+ seq(P2, P4), \+ seq(P2, P5), \+ seq(P3, P4), 
    \+ seq(P3, P5), \+ seq(P4, P5).

not_3_in_same_day(P1, P2, P3, P4, P5) :- 
    \+ eqday(P1, P2, P3), \+ eqday(P1, P2, P4), \+ eq(P1, P2, P5),
    \+ eqday(P1, P3, P4), \+ eqday(P1, P3, P5), \+ eq(P1, P4, P5),
    \+ eqday(P2, P3, P4), \+ eqday(P2, P3, P5), \+ eq(P2, P4, P5),
    \+ eqday(P3, P4, P5).

eqday(A, B, C) :- Z is A // 100, Z is B // 100, Z is B // 100.

solution(P1, P2, P3, P4, P5) :-
    uniq_periods(P1, P2, P3, P4, P5),
    not_2_in_a_row(P1, P2, P3, P4, P5).
    not_3_same_day(P1, P2, P3, P4, P5).

