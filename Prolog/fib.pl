%
% Fibonacci Numbers using memoization
%

:- dynamic fib/2.           % Need to declare that the relation fib with 2 arguments
                            % is dynamic and can updated at runtime.

fib(0,1).
fib(1,1).

fib(X,N) :- X1 is X-1, X2 is X-2,
	    fib(X1,N1), fib(X2,N2), N is N1 + N2,
	    asserta(fib(X,N)),           % add fib(X,N) to the database of facts so we don't have to recalculate it, just look it up
            !.
