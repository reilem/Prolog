# USEFUL PROLOG #

## Built-ins and SWI-prolog library ##

### Built-in predicates ###

#### General ####

```prolog
% is/2 - evaluate arithmetic and unify
X is 3 + 4
X = 7

% ; - disjunction
X = A ; B.

% (A -> B ; C) - if-then-else
(
X > 20 ->
  % Then
;
  % Else
)

% ! - cut (prevent backtracking)
foo(a(A,B)) = !, foo(A), foo(B).
```

#### Term Comparison ####

```prolog
X = Y.  % Unify two terms
X == Y. % Two terms are identical
X \== Y.% Two terms are not identical
X =:= Y.% Two terms arithmetically identical
X =\= Y.% Two terms not arithmetically identical
X < Y.  % X arithmetically smaller than Y.
X > Y.  % X arithmetically bigger than Y
X >= Y. % X arithmetically bigger or equal to Y.
X <= Y. % X arithmetically smaller or equal to Y.
X @< Y. % Term X is smaller than term Y (literal length of characters),
```

### List library predicates ###
```prolog
% length/2 - Length is the number of elements in List.
length(List, Length).

% append/3 - Concatenates List1 and List2 into List.
append(List1, List2, List).

% delete/3 - List2 is List1 with element Elem removed.
delete(List1, Elem, List2).

% select/3 - Returns true if List2 is List1 with Elem removed. Can not be
% used to generate List2.
select(Elem, List1, List2).

% member/2 - Returns true if Elem is an element contained in List.
member(Elem, List).
```

### Non-logical predicates ###

#### Basic ####

```prolog
% var/1   - Success if argument is free
var(Variable).

% atom/1  - Success if argument is bound to an atom
atom(Atom).

% float/1    - Success if argument is a float.
float(F).

% integer/1  - Success if argument is an integer.
integer(I).

% compound/1 - Success if argument is a compound. (ex. a(3,4,"hello")
% is a compound)
compound(C).
```

#### Advanced ####

```prolog
% functor/3 - Returns the Name and Arity from a given term. Arity = # of
% elements in term.
functor(Term, Name, Arity).

% arg/3 - Unifies the Key'th element in the Term to the Variable
arg(Key, Term, Variable).

% =../2 - Takes element of a Term and puts them in a TermList (including the
% name of the term.)
Term =.. TermList
```

### Meta-predicates ###

```prolog
% clause/2 - Attempts to assign all variables in the Term and returns
% a Body which unifies the variables.
clause(Term, Body).

% call/1   - Executes given Goal, goals can have sub-variables.
% A Goal example: X = write(hello). is a goal.
call(Goal).

% \+/1 - Negation of term Bool value.
\+(Bool).
% Ex.
% ?- \+ true.
% false.

% copy_term/2 - Makes a copy of Term using brand new variables into Copy.
copy_term(Term,Copy).

% findall/3 - for each passing of the given Goal, the values
% associated to the passing of the Goal are put into the Bag
% according to the given Template.
% Ex. Template: parent(P)
% Ex. Goal: parent(john,P)
% Ex. Bag: [parent(P1), parent(P2)] where P1 and P2 are parents of John.
findall(Template, Goal, Bag).

% time/1 - performs call on Goal and prints time used.
time(Goal).

% freeze/2 - performs call on Goal once given Var becomes bound.
time(Var, Goal).
```

## List Syntax ##

```prolog
% Syntactic sugar
List = [1,23,4]
% Actual
List = [1 | [23 | [4]]]
% In predicates
list_pred([Head|Tail]).
```

## Programming Techniques ##

### Difference Lists ###

Not really sure what this is useful for.

```prolog
% Head and tail are the same variable.
q_init(X-X).
% Take the head X and add A ([A|Z]), now that Z is the new tail
% return a new diff. list with Z as tail.
q_push(X-_, A, X-Z) :- X = [A|Z].
% Extract value A and tail Z from the head X, and return new diff. list
% with Z as head and old tail Y as tail.
q_pop(X-Y, A, Z-Y) :- X = [A|Z].
```

### Dynamic Predicates ###

Useful for dynamic programming ex. storing sub-results of fibonacci during runtime in a dynamic predicate to save space.

```prolog
% Define dynamic predicate
:- dynamic foo\2.
foo(2,b).
foo(3,c).
% asserta/1 - Add foo(1,a) as first clause
asserta(foo(1,a)).
% assertz/1 - Add foo(4,d) as last clause.
assertz(foo(4,d)).
% retract\1 - Remove all clauses that unify with given predicate.
rectract(foo(X,b)).
```

### Tabulation ###

Stores results of predicates in a table automatically and reuses them.

Fibonacci example:

```prolog
:- table fib/2.
fib(0,0).
fib(1,1).
fib(N,F) :-
  N1 is N - 1,
  N2 is N - 2,
  fib(N1, F1),
  fib(N2, F2),
  F is F1 + F2.
```

### Types and Predicate types ###

You can define types and predicate parameters types just like in haskell.

```prolog
:- type tree --> empty | node(tree, int, tree).
:- pred add_node(tree, int, tree).
```
