% prolog program to find who order pizza using the logic constraint

solution(Danny, Donna, Doreen, David) :-
    Donna = Water,
    beside(Doreen, Steak),
    across(Lasagna, Milk),
    across(David, Danny),
    across(Doreen, Donna),
    Chicken = Coke,
    unique_pos(Danny, Donna, Doreen, David),
    unique_pos(Chicken, Steak, Lasagna, Pizza),
    unique_pos(Water, Coke, Coffee, Milk),
    \+ David = Coffee,
    \+ Danny = Steak,
    print_main_match(Danny, "Danny", Chicken, Steak, Lasgna, Pizza),
    print_drink_match(Danny, Water, Coke, Coffee, Milk),
    print_main_match(Donna, "Donna", Chicken, Steak, Lasgna, Pizza),
    print_drink_match(Donna, Water, Coke, Coffee, Milk),
    print_main_match(Doreen, "Doreen", Chicken, Steak, Lasgna, Pizza),
    print_drink_match(Doreen, Water, Coke, Coffee, Milk),
    print_main_match(David, "David", Chicken, Steak, Lasgna, Pizza),
    print_drink_match(David, Water, Coke, Coffee, Milk).


print_main_match(Name, Str, Chicken, Steak, Lasagna, Pizza) :- 
    Name = Chicken, nl, write(Str), write(' ordered Chicken ').

print_main_match(Name, Str, Chicken, Steak, Lasagna, Pizza) :- 
    Name = Steak, nl, write(Str), write(' ordered Steak ').

print_main_match(Name, Str, Chicken, Steak, Lasagna, Pizza) :- 
    Name = Lasagna, nl, write(Str), write(' ordered Lasagna ').

print_main_match(Name, Str, Chicken, Steak, Lasagna, Pizza) :- 
    Name = Pizza, nl, write(Str), write(' ordered Pizza ').

print_main_match(Name, Str, Chicken, Steak, Lasagna, Pizza) :- 
    Name = Pizza, nl, write(Str), write(' ordered Pizza ').

print_main_match(Name, Str, Chicken, Steak, Lasagna, Pizza) :-
    \+ Name = Chicken, \+ Name = Steak, \+ Name = Lasagna,
    \+  Name = Pizza.

print_drink_match(Name, Water, Coke, Coffee, Milk) :-
    Name = Water, write("and Water"), nl.
print_drink_match(Name, Water, Coke, Coffee, Milk) :-
    Name = Coke, write("and Coke"), nl.
print_drink_match(Name, Water, Coke, Coffee, Milk) :-
    Name = Coffee, write("and Coffee"), nl.
print_drink_match(Name, Water, Coke, Coffee, Milk) :-
    Name = Milk, write("and Milk"), nl.
print_drink_match(Name, Water, Coke, Coffee, Milk) :-
    \+ Name = Water, \+ Name = Coke, \+ Name = Coffee, \+ Name = Milk.

unique_pos(R, S, T, U) :-
    pos(R), pos(S), \+ S = R, pos(T),
    \+ T = R, \+ T = S, pos(U), \+ U = R, 
    \+ U = S, \+ U = T.

pos(1). pos(2). pos(3). pos(4).
side(1, 2). side(3, 4).


beside(X, Y) :- side(X, Y).
beside(X, Y) :- side(Y, X).

opp(1, 3). opp(2, 4).
across(X, Y) :- opp(X, Y).
across(Y, X) :- opp(X, Y).

print_solution :-
    solution(Danny, Donna, Doreen, David).
