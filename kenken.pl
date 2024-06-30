%Prolog program to solve 4 x 4 kenken puzzle

div(X, Y, Z) :- Z =:= X/Y.
div(X, Y, Z) :- Z =:= Y/X.
sub(X, Y, Z) :- Z =:= X - Y.
sub(X, Y, Z) :- Z =:= Y - X.
