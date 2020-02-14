Author: Vikram Gardella

Course: CS 463G

Date Submitted: 10/26/2016

Code Description: My Prolog program takes in the predicate in the
following form: citypath(X1,Y1,X2,Y2,Maze,Path).
where the X's and Y's are coordinates and the Maze is a 2-dimensional
list that the tester must provide. Path is a variable that becomes
instantiated when the tester enters this predicate and should be returned.
My code uses recursion of the citypath predicate where the first X
and first Y coordinate get updated each iteration as well as the "Path"
to keep track of moves. Within each iteration of citypath, explore is
called to find the adjacent spots that are okay to move to. Those
spots should then be compared to spots in "Path" stored as coordinate
pairs to move to a square that has not been visited yet if all the others
have. The end result is "true" reported if there is a possible path
between coordinates within the maze or "false" if not as well as a list
of coordinates that were passed through to get to the end square. This
is "Path."

Technical problems: My code does not entirely successfully perform
previously mentioned goals. My logic behind determining if I'm on the
final square does not work (as simple as it would seem). Another issue
with my code is that it does not check which viable squares have already
been visited. This causes an infinite loop.

What I learned: Prolog is very different from all of the algorithm/function-
based languages I have previously done (C++, Java, etc.) but definitely
has advantages when trying to make certain programs. Although alien to me,
Prolog's logic is simple and when mastered it would be ideal for many
reasoning/qualitative/AI-related problems. It makes me wonder if Prolog
would have made our previous SAT assignment a breeze...
