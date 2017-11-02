tt_divisor(X,N,TT):-
	Q is X/N,
	(0 is X mod N ->
	   (Q=N->
	      TT1 is N+TT;
	      TT1 is N + Q +TT)
	   ;((1 is X mod N)-> false,!);TT=TT1),
	(sqrt(X) > N+2 -> N1 is N+2,
	tt_divisor(X,N1,TT1);
	TT1=X).

perfect(1):-
	false,!.
perfect(X):-
	tt_divisor(X,2,1).
perfect_numbers(N,L):-
	numlist(2,N,LN),
	include(perfect,LN,L).

