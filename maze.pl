
% got the idea for this code for "ind" from "gusbro" on
% stackoverflow.com
ind(M,Y,X,V) :-
	write('in ind'), nl,
	nth1(Y, M, MatrixRow),
	nth1(X, MatrixRow, V),
	write('finished ind'), nl.

% predicate that evaluates whether coordinates are the same
% this will be used to see if the destination is reached
notdest(xo,yo,xf,yf) :-
	\+(xo = xf);
	\+(yo = yf).

% checks to see if a pair of coordinates are already
% in the list "Path"
inPath(c,[c|Path]).
inPath(c,[H|T]):-
	inPath(c,T).



% the following "can_walk_to" predicates check to see
% if adjacent squares are within bounds and have a "0"

%this part deals with whether moving up is possible
can_walk_to(XA,YA,XB,YB,Maze,NextX,NextY) :-
	write('XB is '), write(XB), nl,
	write('YB is '), write(YB), nl,
	XB is XA,
	YB is YA-1,
	YB > 0,
	write('XB is now '),
	write(XB), nl,
	ind(Maze, XB, YB, Value),
	write('Value is '),
	write(Value), nl,
	Value is 0,
	write('Can move from ('),
	write(XA), write(','),
	write(YA), write(') to ('),
	write(XB), write(','),
	write(YB), write(')'), nl,
	NextX = XB,
	NextY = YB.
%	inPath((NextX,NextY),Path).



% this part deals with whether moving down is possible
can_walk_to(XA,YA,XB,YB,Maze,NextX,NextY) :-
	write('XB is '), write(XB), nl,
	write('YB is '), write(YB), nl,
	XB is XA,
	YB is YA+1,
	YB < 6,
	write('XB is now '),
	write(XB), nl,

	write('works'),
	ind(Maze, XB, YB, Value),
	write('Value is '),
	write(Value), nl,
	Value is 0,
	write('Can move from ('),
	write(XA), write(','),
	write(YA), write(') to ('),
	write(XB), write(','),
	write(YB), write(')'), nl,
	NextX = XB,
	NextY = YB.
%	inPath((NextX,NextY),Path).


% this part deals with whether moving left is possible
can_walk_to(XA,YA,XB,YB,Maze,NextX,NextY) :-
	write('XB is '), write(XB), nl,
	write('YB is '), write(YB), nl,
	XB is XA-1,
	YB is YA,
	XB > 0,
	write('XB is now '),
	write(XB), nl,


	ind(Maze, XB, YB, Value),
	write('Value is '),
	write(Value), nl,
	Value is 0,
	write('Can move from ('),
	write(XA), write(','),
	write(YA), write(') to ('),
	write(XB), write(','),
	write(YB), write(')'), nl,
	NextX = XB,
	NextY = YB.
%	inPath((NextX,NextY),Path).



% this part deals with whether moving right is possible
can_walk_to(XA,YA,XB,YB,Maze,NextX,NextY) :-
	write('XB is '), write(XB), nl,
	write('YB is '), write(YB), nl,
	XB is XA+1,
	YB is YA,
	XB < 5,
	write('XB is now '),
	write(XB), nl,


	ind(Maze, XB, YB, Value),
	write('Value is '),
	write(Value), nl,
	Value is 0,
	write('Can move from ('),
	write(XA), write(','),
	write(YA), write(') to ('),
	write(XB), write(','),
	write(YB), write(')'), nl,
	NextX = XB,
	NextY = YB.
%	inPath((NextX,NextY),Path).


% got the idea for this code from Dr. Goldsmith, it uses
% recursion to continously explore adjacent squares and
% adds them to "Path" each iteration, thus building it


% this finds adjacent squares that are ok to move to
% and reports their x any coordinates back to citypath
% via NextX and NextY
explore(X1,Y1,Maze,Path,NextX,NextY) :-
	write('Current coordinates: ('),
	write(X1),
	write(','),
	write(Y1),
	write(')'),
	nl,
	Y2 is Y1,
	X2 is X1+1,%check right
	can_walk_to(X1,Y1,X2,Y1,Maze,NextX,NextY);
	X2 is X1,
	Y2 is Y1+1,%check down
	can_walk_to(X1,Y1,X2,Y2,Maze,NextX,NextY);
	Y2 is Y1,
	X2 is X1-1,%check left
	can_walk_to(X1,Y1,X2,Y1,Maze,NextX,NextY);
	X2 is X1,
	Y2 is Y1-1,%check up
	can_walk_to(X1,Y1,X2,Y2,Maze,NextX,NextY).
%	Path = [(X2,Y2)|Path],
%	write('Path is '),
%	write(Path), nl, nl.
%	explore(NewX,NewY,X2,Y2,Maze,NewPath).

% this is a recursive function that calls explore each
% iteration then picks one of the ok adjacent squares to
% move to
citypath(X1,Y1,X3,Y3,Maze,Path) :-
%	write('citypath coordinates: ('),
	write(X1),
	write(','),
	write(Y1),
	write(')'),
	nl,%NextX and NextY are coordinates of an ok move
	explore(X1,Y1,Maze,Path,NextX,NextY),
	write('Moving to ('),
	write(NextX),
	write(','),
	write(NextY),
	write(')'), nl,
	NewPath = [(NextX,NextY)|Path],
%	notdest(NextX,NextY,X3,Y3),
	write('about to recurse'), nl, nl,
	citypath(NextX,NextY,X3,Y3,Maze,NewPath).
