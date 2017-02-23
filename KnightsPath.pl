next(X/Y, K/L) :- square(X,Y,K,L),
	(
	K is X + 2, L is Y - 1;
	K is X + 2, L is Y + 1;
	K is X + 1, L is Y - 2;
	K is X + 1, L is Y + 2;
	K is X - 2, L is Y - 1;
	K is X - 2, L is Y + 1;
	K is X - 1, L is Y - 2;
	K is X - 1, L is Y + 2
	).

square(X/Y) :- square(X,Y).
square(X,Y,K,L) :-
	between(1, 8, X),
	between(1, 8, Y),
	between(1, 8, K),
	between(1, 8, L).

move(X,[],[X]).
move(X,[K|L],[K|L1]) :-	move(X,L,L1).

knightpath([_]).
knightpath(Path) :-
	knightpath(Temp),
	last(Temp, Lst), next(Lst,Nxt),
	move(Nxt, Temp, Path).

knightpassthru([Sqr|_], Sqr, 0).
knightpassthru([_|Path], Sqr, N) :-
	knightpassthru(Path, Sqr, Q), N is Q + 1.

knightjourney(Start, End, L, Path) :-
	knightpath(Tmp),
	(   nonvar(Path) -> knightpath(Path) ->
	    [Start|_] = Path, last(Path, End) -> length(Path, Len), L is Len - 1;

	    [Start|_] = Tmp, last(Tmp, End), length(Tmp, Len), L is Len - 1, Path = Tmp
	).
