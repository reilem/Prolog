% Hint: Use the predefined predicates is_list/1 and append/3
% (**) Flatten a nested list structure.
% my_flatten(List, FlattenedList)
my_flatten(List, X) :- my_flatten(List, [], X).

my_flatten([]   , X  , X).
my_flatten([H|T], Acc, X) :-
    (
     (is_list(H) -> my_flatten(H, Acc, X))
    ;
     append(Acc, [H], NewAcc),
     my_flatten(T, NewAcc, X)
    ).

% not using 'dirty' if else
