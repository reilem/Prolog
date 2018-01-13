/*
P23 (**) Extract a given number of randomly selected
         elements from a list.
The selected items shall be put into a result list.
Example:
?- rnd_select([a,b,c,d,e,f,g,h],3,L).
L = [e,d,a]
*/
rnd_select(List, Amount, Res) :-
    length(List,Length),
    Amount =< Length,
    rnd_index_selector(Length, Amount, [], Indices),
    rnd_selector(List,Indices, [], Res).

%selects the elements
rnd_selector(List,[], Res, Res).
rnd_selector(List,[HIndex|T], Acc, Res) :-
    nth1(HIndex, List, E),
    append(Acc,[E],NewAcc),
    rnd_selector(List,T, NewAcc, Res).

%selects the indices
rnd_index_selector(_,0,R,R).
rnd_index_selector(ListLength, Amount, Acc, R) :-
    (
         ListLengthRnd is ListLength + 1,
         random(1,ListLengthRnd,X),
         \+ subset([X],Acc)
    ->
        append(Acc,[X],NewAcc),
        NewAmount is Amount - 1,
        rnd_index_selector(ListLength, NewAmount, NewAcc, R),!
    ;
        rnd_index_selector(ListLength, Amount, Acc, R)
    ).
