% This is the Prolog definition of the game Race to 21.
player(max). player(min).
initial_state(21, max).

game_over(0, max, min).
game_over(0, min, max).

legal_move(OldState, _, Move, NewState) :-
    small_number(Move),
    OldState >= Move,
    NewState is OldState - Move.

small_number(1).
small_number(2).
