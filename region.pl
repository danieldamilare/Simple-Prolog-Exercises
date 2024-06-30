% The five types of regions that can appear in an image
region(grass). region(water). region(pavement). region(house).
region(vehicle).

% small(X) holds when region X can be small in image.
small(vehicle).

% regular(X) holds when X is regular in shape
regular(pavement). regular(house). regular(vehicle).

border(X, Y) :- \+ bad_border(X, Y), \+ bad_border(Y, X).

% Unacceptable borders
bad_border(X, X).
bad_border(house, water).
bad_border(vehicle, X) :- \+ X = pavement.

% inside(X, Y) holds when region X can be surrounded by Y
inside(X, Y) :- \+ bad_inside(X, Y).

%Unacceptabe containment
bad_inside(X, X).
bad_inside(house, water).
bad_inside(vehicle, X) :- \+ X= pavement.
bad_inside(pavement, _).

solution(R1, R2, R3, R4, R5) :-

    %region 5 is small and regular
    region(R5), small(R5), regular(R5), 

    % region 3 is large and regular
    region(R3), \+ small(R3), regular(R3),

    % region 2 is large, not regular and region 3 is inside region 2
    region(R2), \+ small(R2), \+ regular(R2), inside(R3, R2),

    % region 4 is large and region 5 is inside region 4
    region(R4), \+ small(R4), inside(R5, R4),

    % region 2 borders region 4
    border(R2, R4), 

    % region 1 is large, not regular and borders region 2
    region(R1), \+ regular(R1), border(R1, R2), 
    \+ small(R1).

