%% (*) Duplicate the elements of a list.
% dupli(List,X).

dupli(List,X) :- dupli(List, [], X).
dupli([],X,X).
dupli([H|T], Acc, X) :-
    append(Acc,[H,H],NewAcc),
    dupli(T,NewAcc,X).
