/*
P19 (**) Rotate a list N places to the left.
Examples:
?- rotate([a,b,c,d,e,f,g,h],3,X).
X = [d,e,f,g,h,a,b,c]

?- rotate([a,b,c,d,e,f,g,h],-2,X).
X = [g,h,a,b,c,d,e,f]

Hint: Use the predefined predicates length/2 and append/3,
      as well as the result of problem P17.
*/

rotate(L,0,L).
rotate([H|T], N, X) :-
    N > 0,
    N1 is N - 1,
    append(T, [H], NewList),
    rotate(NewList, N1, X).
