/*
P24 (*) Lotto: Draw N different random numbers from the set 1..M.
The selected numbers shall be put into a result list.
Example:
?- rnd_select(6,49,L).
L = [23,1,17,33,21,37]

Hint: Combine the solutions of problems P22 and P23.
*/

:- ensure_loaded('22.pl').
:- ensure_loaded('23.pl').

lotto(N, M, X) :- range(1,M,L), rnd_select(L,N,X).
