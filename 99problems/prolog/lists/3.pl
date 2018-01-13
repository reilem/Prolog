% (*) Find the last but one element of a list.
% elem(list, index, elem).
elem([X|_], 1, X).
elem([_|T], N, X) :-
    N > 1,
    N_min is N - 1,
    elem(T, N_min, X).

% met een findall
try(List) :-
    findall(X,elem([1,2,"Wat een kut vak"],3,X),List).
