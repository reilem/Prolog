/*
(*) Insert an element at a given position into a list.
Example:
?- insert_at(alfa,[a,b,c,d],2,L).
L = [a,alfa,b,c,d]
*/

insert_at(Elem, List, Pos, Res) :-
    length(List, Length),
    Pos \= Length,
    insert_atH(Elem, List, Pos, [], Res).

insert_at(Elem, List, Pos, Res) :-
    length(List, Length),
    Pos == Length,
    append(List, [Elem], Res).

insert_atH(_, [], _, Res, Res).

insert_atH(Elem, [H|T], 0, Acc, Res) :-
    append(Acc, [Elem], NewAcc),
    insert_atH(Elem, [H|T], -1, NewAcc, Res).

insert_atH(Elem, [H|T], N, Acc, Res) :-
    N \= 0,
    append(Acc,[H], NewAcc),
    N1 is N - 1,
    insert_atH(Elem, T, N1, NewAcc, Res).
