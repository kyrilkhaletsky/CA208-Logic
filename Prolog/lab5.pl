% Lab Session 5
%

% Q1

class(0,zero) :- !.

class(N,positive) :- N > 0, !.

class(N, negative) :- N < 0, !.


% Q2

split([],[],[]).

split([X|XS], [X|PS], N) :- X >= 0, split(XS,PS,N), !.

split([X|XS], P, [X|NS]) :- split(XS,P,NS), !.


% Q3

fib(0,1).
fib(1,1).

fib(X,N) :- X1 is X-1, X2 is X-2, fib(X1,N1), fib(X2,N2), N is N1 + N2, !.

