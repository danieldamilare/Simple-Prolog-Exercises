% this predicate breaks up a quoted string into a list of constants
split_words(String,Words) :- 
   atom_codes(String,List), scan_codes(List,[],[],Words).
    
scan_codes([],RevChars,RevWords,F) :- 
   add_word(RevChars,RevWords,New), reverse(New,F).
scan_codes([Char|Chars],RevChars,RevWords,F) :- 
   blank(Char), add_word(RevChars,RevWords,New),
   scan_codes(Chars,[],New,F).
scan_codes([Char|Chars],RevChars,RevWords,F) :- 
   punc(Char,Name), add_word(RevChars,RevWords,New),
   scan_codes(Chars,[],[Name|New],F).
scan_codes([Char|Chars],RevChars,RevWords,F) :- 
   alpha(Char), 
   scan_codes(Chars,[Char|RevChars],RevWords,F).

add_word([],Old,Old).
add_word(RevChars,Old,[Word|Old]) :- 
  \+ RevChars=[], reverse(RevChars,Chars), atom_codes(Word,Chars). 

blank(32). 
punc(44,'*comma*'). 
punc(46,'*period*'). 
punc(63,'*question*'). 
punc(33,'*exclamation*'). 
punc(58,'*colon*'). 
punc(59,'*semicolon*'). 
alpha(Char) :- 65 =< Char, Char =< 90.
alpha(Char) :- 97 =< Char, Char =< 122.

% These predicates deal with the case of a word

upcase(Lower,Upper) :- 
  atom_codes(Lower,[Lo|L]), Hi is Lo-32, atom_codes(Upper,[Hi|L]).
downcase(Upper,Lower) :- 
  atom_codes(Upper,[Hi|L]), Lo is Hi+32, atom_codes(Lower,[Lo|L]).

% This one ensures the word is in lowercase 
lower_case(Word,Word) :- 
  atom_codes(Word,[Ch|_]), 97 =< Ch, Ch =< 122.
lower_case(Word,Lower) :- 
  atom_codes(Word,[Ch|_]), 65 =< Ch, Ch =< 90, downcase(Word,Lower).

% This pair adds or removes a trailing 's' from a word
add_s(Sing,Plur) :-  atom_codes(s,[S]),
  atom_codes(Sing,L), reverse(L,L1), 
  reverse([S|L1],L2), atom_codes(Plur,L2).
rem_s(Plur,Sing) :-  atom_codes(s,[S]),
  atom_codes(Plur,L), reverse(L,[S|L1]), 
  reverse(L1,L2), atom_codes(Sing,L2).
