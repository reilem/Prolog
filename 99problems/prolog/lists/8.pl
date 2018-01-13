%%% (**) Eliminate consecutive duplicates of list elements.
%%
%% -If a list contains repeated elements they should
%% be replaced with a single copy of the element.
%% The order of the elements should not be changed.

 %compress(List, CompressedList)
compress(List, X) :- compress(List, [], X).

compress([]   , R          , R).

compress([H|T], Acc, X) :-
    last(Acc, Last),
    H == Last, %if this passes, the current elem is already in the
               %list do nothing
    compress(T, Acc, X), !.

compress([H|T], Acc, X) :-
    append(Acc, [H], NewAcc),
    compress(T, NewAcc, X).
