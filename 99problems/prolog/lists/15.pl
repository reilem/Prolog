%% (**) Duplicate the elements a given number of times.
%Example:
%?- dupli([a,b,c],3,X).
%X = [a,a,a,b,b,b,c,c,c]

dupli(List, Amount, X) :-
    dupli(List, Amount, Amount, [], X).

dupli([], _, _, X, X).
dupli([_H|T], Amount, 0, Acc, X) :-
    dupli(T, Amount, Amount, Acc, X), !.
    % cut: je moet niet meer kijken naar gevallen waarbij
    %      we ipv headommitten toch nog gaan proberen om
    %      de volgende case te runnen (0>0 is dom)
dupli([H|T], Amount, CurAmount, Acc, X) :-
    CurAmount > 0,
    append(Acc, [H], NewAcc),
    NewCurAmount is CurAmount - 1,
    dupli([H|T], Amount, NewCurAmount, NewAcc, X).
