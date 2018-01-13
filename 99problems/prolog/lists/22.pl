/*
1.22 (*):  Create a list containing all integers within
             a given range.
range(I,K,L) :- I <= K, and L is the list containing all
    consecutive integers from I to K.
    (integer,integer,list) (+,+,?)
*/

range(I,J,L) :- rangeH(I,J,I,[],L).

rangeH(_I,J,Last,Acc,L) :-
    J < Last,
    L = Acc.

rangeH(I,J,Last,Acc,L) :-
    J >= Last,
    append(Acc,[Last],NewAcc),
    NewLast is Last + 1,
    rangeH(I,J,NewLast,NewAcc,L).
