%% (**) Run-length encoding of a list (direct solution).
%  use some sort of counting instead of list building
encode_direct([],[]).
encode_direct(List, X) :-
    count(List, X).

%% count(List, Current, Count, Acc, X)
%  this one acts as a transition to the real function
count([H|T], X) :- count(T, H, 1, [], X).

%base case with single end node
count([], Y, 1, Acc, X) :-
    append(Acc, [Y], X), !.

%base case with more than one end node
count([], Y, Count, Acc, X) :-
    append(Acc, [[Y, Count]], X).

%general iteration case for equal head to curElem
count([H|T], H, Count, Acc, X) :-
    Inc is Count + 1,
    count(T, H, Inc, Acc, X), !.

%case catching bare element to be printed
count([H|T], Y, 1, Acc, X) :-
    Y \= H,
    append(Acc, [Y], NewAcc),
    count([H|T], H, 0, NewAcc, X), !.

%general case for unmatching strings
count([H|T], Y, Count, Acc, X) :-
    Y \= H,
    append(Acc, [[Y, Count]], NewAcc),
    count([H|T], H, 0, NewAcc, X).
