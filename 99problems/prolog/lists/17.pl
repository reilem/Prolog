/*
(*) Split a list into two parts; the length of the first part is given.
?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
L1 = [a,b,c]
L2 = [d,e,f,g,h,i,k]
*/

split(L, N, L1, L2) :-
    length(L, Length),
    Length >= N,
    splitH(L, N, [], L1, L2).


splitH(L2, 0, L1, L1, L2).

splitH([H|T], N, Acc, L1, L2) :-
  N > 0,
  append(Acc, [H], NewAcc),
  N1 is N - 1,
  splitH(T, N1, NewAcc, L1, L2).
