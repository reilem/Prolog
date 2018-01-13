%Find the number of elements of a list.
%my_length(List,N)
my_length([],0).
my_length([_|T],N) :-
    my_length(T, N1),
    N is N1 + 1.


%%acc version with tail recursion

% my_length2(Lijst, Acc, N)
my_length2(List,N) :- my_length2(List,0,N).

my_length2([],N,N).
my_length2([_|T], Previous, N) :-
    P1 is Previous + 1,
    my_length2(T,
               P1,
               N).
