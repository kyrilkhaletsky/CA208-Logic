% Lab Session 4
%

% The naive solution

fib(0,1).
fib(1,1).

fib(X,N) :- X1 is X-1, X2 is X-2, fib(X1,N1), fib(X2,N2), N is N1 + N2.

% There are 2 ways we can improve this.
% 1. Add cuts
% 2. Use "memoization", when we calculate the Fibonacci number of X then
% add it to the database of facts using asserta(fib(X,N)).


% tA is a binary relation, so it will take 2 arguements and evaluate to
% true or false. If we were not using a binary operator we would define
% tA(Base,Height,Area) to be true if Area = 0.5*Base*Height. This is a
% ternary relation, so to make it binary we need to combine Area and
% Height into one argument using the / operator,
% i.e. tA(Base/Height,Area). Then we can write the binary operator
% Base/Height tA Area

:- op(500, xfy, tA).

X/Y tA Z :- Z is 0.5*X*Y.      % area of a triangle 0.5*base*perpendicular_height
