/*
**) Generate the combinations of K distinct
    objects chosen from the N elements of a list
In how many ways can a committee of 3 be chosen from a group
of 12 people? We all know that there are C(12,3) = 220
possibilities (C(N,K) denotes the well-known binomial
coefficients). For pure mathematicians, this result may be
great. But we want to really generate all the possibilities
(via backtracking).
*/

combination(Depth, List, Res) :-
    dig([], List, FirstStep),
    depthEnforcer(Depth, 1, [], FirstStep, Dug),
    cleanup(Dug, [], Res).

%if the depth has been reached, good job! stop digging
depthEnforcer(Depth, Depth, _IterateAcc, Res, Res) :- !.

%if the acc has been dug out, proceed to next level
depthEnforcer(Depth, CurrentLevel, IterateAcc, [], Res) :-
    NewLevel is CurrentLevel + 1,
    %notice how I swapped iterateAcc and acc
    depthEnforcer(Depth, NewLevel, [], IterateAcc, Res).

%enforce the digging behavior for each to dig element.
depthEnforcer(Depth, CurrentLevel, IterateAcc, [[H,T]|AccT], Res) :-
    dig(H,T,DigRes),
    append(IterateAcc,DigRes,NewIterateAcc),
    depthEnforcer(Depth, CurrentLevel, NewIterateAcc, AccT, Res).

dig(OldSub,[],OldSub).
dig(OldSub,OldOptions,Res) :-
    length(OldOptions,Index),
    digH(OldSub,OldOptions,Index,[], Res).

digH(_OldSub, _OldOptions, 0, Res, Res).
digH(OldSub, OldOptions, Index, DigAcc, Res) :-
    Index > 0,
    nth1(Index, OldOptions, Sub, Options),
    append(OldSub,[Sub], Head),
    append(DigAcc, [[Head,Options]], NewDigAcc),
    NewIndex is Index - 1,
    digH(OldSub,OldOptions,NewIndex,NewDigAcc,Res).

cleanup([],Res,Res).
cleanup([[A,_]|T],Acc,Res) :- append(Acc,[A],NewAcc), cleanup(T, NewAcc,Res).
