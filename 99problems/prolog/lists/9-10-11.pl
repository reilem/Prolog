%% (**) Pack consecutive duplicates of list elements into sublists.
% If a list contains repeated elements they should be
% placed in separate sublists.

pack([H|T], X) :-
    pack(T, [H], [], X).

%pack(List, PackingList   , Acc, X)
pack([]   , Package  , Y  , X) :- append(Y,[Package],X).

pack([H|T], [PackageH|PackageT]  , Acc, X) :-
    PackageH == H, % if this passes, the current elem is
                   % already in the list do nothing
    append([PackageH|PackageT],[H],NewPackage),
    pack(T, NewPackage, Acc, X), !.

pack([H|T], Package, Acc, X) :-
    append(Acc, [Package], NewAcc),
    pack(T, [H], NewAcc, X).

%% (*) Run-length encoding of a list
% encode(List, Out)

encode(List, X) :-
    pack(List, Res),
    encode(Res, [], X).

encode([]         , R  , R).
encode([[EH|ET]|T], Acc, X) :-
    length([EH|ET],Len),
    append(Acc, [[Len,EH]], NewAcc),
    encode(T, NewAcc, X).

%% other option
encode2(List, X) :-
    pack(List, Res),
    encode2(Res, [], X).

encode2([]         , R  , R) :- !.
encode2([[EH|ET]|T], Acc, X) :-
    length([EH|ET],Len),
    Len == 1,
    append(Acc, [EH], NewAcc), !,
    encode2(T, NewAcc, X).

encode2([]         , R  , R).
encode2([[EH|ET]|T], Acc, X) :-
    length([EH|ET],Len),
    append(Acc, [[EH,Len]], NewAcc), !,
    encode2(T, NewAcc, X).
