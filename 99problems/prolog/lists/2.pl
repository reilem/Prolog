% (*) Find the last but one element of a list.
voor_laatste(X, [X, _Y | [] ]).
voor_laatste(X, [_|T]) :- voor_laatste(X, T).
