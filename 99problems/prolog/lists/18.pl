/*
P18 (**) Extract a slice from a list.
Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

Example:
?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
X = [c,d,e,f,g]
*/

slice(List, I, J, L) :-
    I =< J,
    sliceH(List, I, J, 1, [], L).

%sliceH(List, I, J, Acc, L)
sliceH([],_,_,_,X,X).
sliceH([H|T], I, J, Elem, Acc, L) :-
    Elem >= I,
    Elem =< J,
    append(Acc,[H],NewAcc),
    NewElem is Elem + 1,
    sliceH(T, I, J, NewElem, NewAcc, L).
sliceH([_H|T], I, J, Elem, Acc, L) :-
    (Elem < I
    ;
    Elem > J),
    NewElem is Elem + 1,
    sliceH(T, I,J,NewElem,Acc,L).
