%% (**) Decode a run-length encoded list.
% Given a run-length code list generated
% as specified in problem P11. Construct its
% uncompressed version.

decode(List,X) :- decode(List, [], X).

decode([], X, X).
decode([[1|Letter]|T], Acc, X) :-
    append(Acc,Letter,NewAcc),
    decode(T, NewAcc, X).

decode([[Count|Letter]|T], Acc, X) :-
    append(Acc,Letter,NewAcc),
    Dec is Count - 1,
    Dec > 0,
    decode([[Dec|Letter]|T], NewAcc, X), !.

decode([H|T], Acc, X) :-
    append(Acc,[H],NewAcc),
    decode(T,NewAcc,X).
