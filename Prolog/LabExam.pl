/* Facts */
road(northbog, westhome, 3).
road(oldtown, westhome, 4).
road(oldtown, poshville, 5).
road(villanua, oldtown,2).
road(eastwick, poshville,2).
road(poshville, northbog, 3).
road(westpark, villanua, 2).
road(westpark, southfork,7).
road(southfork, eastwick, 2).

/* Rules */
between(X,Y,Z) :- road(X, Y, _), road(Y,Z, _).
near(X,Y) :- road(X,Y, DISTANCE), DISTANCE < 3.
far(X,Y) :- road(X,Y, DISTANCE), DISTANCE >=3.

route(A,B) :- road(A,B,_).
route(A,B) :- road(A,C,_), route(C,B).

routen(A,B,DISTANCE) :- road(A,B,DISTANCE).
routen(A,B,DISTANCE) :- road(A,X,D1), routen(X,B,D2), DISTANCE is D1+D2.

canwalk(A, B) :- routen(A,B, DISTANCE), DISTANCE =< 4.
cancycle(A, B) :- routen(A,B, DISTANCE), DISTANCE =< 6.