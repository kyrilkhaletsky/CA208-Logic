/* Labs 3 */

myElem(X,[X|_]).

myElem(X,[_|XS]) :- myElem(X,XS).


myHead(X,[X|_]).


myLast(X,[X]).

myLast(X,[_|LS]) :- myLast(X,LS).


myTail(X,[_|X]).


myAppend([],Y,Y).

myAppend([X|XS],Y,[X|Z]) :- myAppend(XS,Y,Z).


myReverse([],[]).

myReverse([X|XS],Y) :- myReverse(XS,R), myAppend(R,[X],Y).


myDelete(X,[X|L1],L1).

myDelete(X,[Y|L1],[Y|L2]) :- myDelete(X,L1,L2).
