/*
P20 (*) Remove the K'th element from a list.
Example:
?- remove_at(X,[a,b,c,d],2,R).
X = b
R = [a,c,d]
*/

remove_at(X,List,Elem,R) :- remove_atH(X,List,Elem,[], false,R).


%base case
remove_atH(X,[],_,R, X, R).

%the remove case
remove_atH(X, [H|T], 1, Acc, _, R) :-
    remove_atH(H, T, -1, Acc, X, R).

remove_atH(X,[H|T],N,Acc, XAcc,R) :-
    N \= 1,
    append(Acc,[H],NewAcc),
    N1 is N - 1,
    remove_atH(X, T, N1,NewAcc, XAcc,R).
