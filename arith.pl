% Define digits from 0 to 9
num(0). num(1). num(2). num(3). num(4). num(5).
num(6). num(7). num(8). num(9).

% Ensure all digits are unique
uniq_num([]).
uniq_num([H|T]) :- \+ member(H, T), uniq_num(T).

% Construct the number from a word based on assigned digits
word_to_num([], _, 0).
word_to_num([L|Ls], Digits, Num) :-
    word_to_num(Ls, Digits, Num1),
    member((L, D), Digits),
    Num is Num1 * 10 + D.

% Solve the cryptarithmetic puzzle
solve_cryptarithm(Word1, Word2, Result, Digits) :-
    % Ensure all words use unique digits
    append([Word1, Word2, Result], Letters),
    uniq_num(Letters),
    
    % Assign digits to letters
    assign_digits(Letters, Digits),
    
    % Construct the numbers from the words
    word_to_num(Word1, Digits, Num1),
    word_to_num(Word2, Digits, Num2),
    word_to_num(Result, Digits, ResultNum),
    
    % Ensure the arithmetic constraint is met
    ResultNum =:= Num1 + Num2,
    
    % Print the solution
    print_solution(Digits).

% Assign digits to letters
assign_digits([], []).
assign_digits([L|Ls], [(L, D)|Rest]) :-
    num(D),
    assign_digits(Ls, Rest).

% Print the solution
print_solution([]).
print_solution([(L, D)|Rest]) :-
    format('~w = ~d~n', [L, D]),
    print_solution(Rest).


