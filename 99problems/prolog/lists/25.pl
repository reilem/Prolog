/*
(*) Generate a random permutation of the elements of a list.
Example:
?- rnd_permu([a,b,c,d,e,f],L).
L = [b,a,d,c,e,f]

Hint: Use the solution of problem P23.
*/

:-ensure_loaded('23.pl').

rnd_permu(List, X) :-
    length(List, Amount),
    rnd_select(List, Amount, X).
