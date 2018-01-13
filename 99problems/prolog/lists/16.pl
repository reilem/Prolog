/*
P16 (**) Drop every N'th element from a list.
Example:
    ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
    X = [a,b,d,e,g,h,k]
*/

drop(List, N, X) :- drop(List, N, N, [], X).

%drop(List, N, CurN, Acc, Result)
drop( [] , _    , _      , X  , X).

drop([H|T], N, Cur, Acc, X ) :-
    Cur > 1,
    append(Acc,[H],NewAcc),
    NewCur is Cur - 1,
    drop(T, N, NewCur, NewAcc, X).

drop([_|T], N, 1, Acc, X ) :-
    drop(T,N,N,Acc,X).
