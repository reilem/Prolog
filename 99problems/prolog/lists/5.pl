%my_reverse(List, Reversed)
my_reverse(L,R) :- my_rev(L,R,[]).

my_rev([],R,R).
my_rev([LH|LT],Acc,R) :-
    my_rev(LT,
           [LH|Acc],
           R).
