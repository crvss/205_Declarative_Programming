
% Program: ROYAL

parent(mary,georgeVI).
parent(mary,henry).
parent(mary,george).
parent(georgeV,georgeVI).
parent(georgeV,henry).
parent(georgeV,george).
parent(elizabeth,elizabethII).
parent(georgeVI,elizabethII).
parent(alice,richard).
parent(henry,richard).
parent(elizabethII,charles).
parent(elizabethII,andrew).
parent(elizabethII,anne).
parent(elizabethII,edward).
parent(philip,charles).
parent(philip,andrew).
parent(philip,anne).
parent(philip,edward).
parent(diana,william).
parent(diana,harry).
parent(charles,william).
parent(charles,harry).
parent(sarah,beatrice).
parent(sarah,eugenie).
parent(andrew,beatrice).
parent(andrew,eugenie).
parent(anne,peter).
parent(anne,zara).
parent(mark,peter).
parent(mark,zara).
parent(kate,georgejun).
parent(kate,charlotte).
parent(kate,louis).
parent(william,georgejun).
parent(william,charlotte).
parent(william,louis).
parent(meghan,archie).
parent(harry,archie).

the_royal_females([mary,elizabeth,elizabethII,alice,anne,diana,sarah,
beatrice,zara,eugenie,charlotte,kate,meghan]).

the_royal_males([georgeV,georgeVI,george,philip,charles,andrew,edward,
richard,henry, william,harry,peter,georgejun,mark,louis,archie]).

%%%%%%%%%%%%%%%%%%%%%%%%%%

the_royal_family(XS) :- 
the_royal_females(X),
the_royal_males(Y),
append(X, Y, XS).

%%%%%%%%%%%%%%%%%%%%%%%%%%

mother(X, Y) :- 
the_royal_females(A),
parent(X, Y), member(X, A).

%%%%%%%%%%%%%%%%%%%%%%%%%%

grandma(X, Z) :- 
the_royal_females(A),
parent(X, Y), parent(Y, Z), member(X, A).

%%%%%%%%%%%%%%%%%%%%%%%%%%

has_child(X) :- parent(X,_).

%%%%%%%%%%%%%%%%%%%%%%%%%%

ancestor(X, X).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%

sibling(X, Y) :- parent(Z, X), parent(Z, Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%

sister(X, Y) :- 
the_royal_females(A),
member(X, A),
parent(Z, X), parent(Z, Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%

grandchild(X, Y) :- parent(Y, Z), parent(Z, X).

%  grandchild(X, georgeV).
%  X = elizabethII ;
%  X = richard ;
%  false.

%%%%%%%%%%%%%%%%%%%%%%%%%%

% who has a kid?
% has_child(X).
% X = mary ;
% X = georgeV ;
% X = elizabeth ;
% X = georgeVI ;
% X = alice ;
% X = henry ;
% X = elizabethII ;
% X = philip ;
% X = diana ;
% X = charles ;
% X = sarah ;
% X = andrew ;
% X = anne ;
% X = mark ;
% X = kate ;
% X = william ;
% X = meghan ;
% X = harry.

%repetitions removed

%%%%%%%%%%%%%%%%%%%%%%%%%%

% ancestor(X, archie).
% X = archie ;
% X = mary ;
% X = georgeV ;
% X = elizabeth ;
% X = georgeVI ;
% X = elizabethII ;
% X = philip ;
% X = diana ;
% X = charles ;
% X = meghan ;
% X = harry ;
% false.

%%%%%%%%%%%%%%%%%%%%%%%%%%

cousin(X, Y) :- parent(Z, X), sibling(Z, A), parent(A, Y).

% cousin(eugenie, X).
% X = william ;
% X = harry ;
% X = beatrice ;
% X = eugenie ;
% X = peter ;
% X = zara ;
% false.

%repetitions removed

%%%%%%%%%%%%%%%%%%%%%%%%%%

has_cousin_who_is_grandma(X) :- cousin(X, Z), grandma(Z, _).

%  has_cousin_who_is_grandma(X).
% X = elizabethII ;
% X = richard ;
% false.

%repetitions removed

%%%%%%%%%%%%%%%%%%%%%%%%%%

grandfather(X, Z) :- 
the_royal_males(B),
parent(X, Y), parent(Y, Z), member(X, B).

brother(X, Y) :-
the_royal_males(B),
member(X, B),
parent(Z, X), parent(Z, Y). 

has_brother_who_is_grandfather(X) :-
brother(X, Y), grandfather(Y, _).

% has_brother_who_is_grandfather(X).
% X = georgeVI ;
% X = george ;
% X = charles ;
% X = andrew ;
% X = edward ;
% X = henry ;
% false.

% repetitions removed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Program: TRAINS

train(swansea, cardiff, [3,5,8,15,17,18,19,20,23],1,[4,5,6,7,10,14,18,22,23],2).
train(cardiff, manchester, [7,11,16],4,[8,14,19],5).
train(cardiff, bristol, [3,5,7,11,15,18,19,20],2,[5,6,7,10,14,16,18,22],2).
train(manchester, bristol, [5,6,7,8,11,15,18,19,20],4,[5,6,7,10,14,16,18,22],5).
train(manchester, swansea, [7,11,16],5,[8,14,19],6).
train(manchester, london, [6,7,11,16],4,[7,8,14,19],5).
train(cardiff, london, [5,6,7,11,18,19,20],3,[8,9,17,18,19,20,21],3).
train(london, brussels, [6,7,8,11,13,17,18,20],5,[9,11,13,16,17,18,19,23],5).
train(london, paris, [7,11,13,17,18,20],5,[9,11,13,16,18,20],6).
train(paris, brussels, [7,11,17],4,[9,13,19],3).
train(paris, munich, [7,11,13,17,22],8,[5,9,13,19,23],7).
train(munich, vienna, [8,9,11,13,17,19],6,[9,10,12,16,18,23],5).
train(vienna, venice, [5,7,8,10,13,16,12,23],8,[2,4,7,9,12,20,21,23],9).
train(venice, paris, [4,11,20],11,[9,12,21],10).

%%%%%%%%%%%%%%%%%%%%%%%%%%

mem_rem(H, [H|T], R) :- R = T.
mem_rem(X, [H|T], [H|R]) :- mem_rem(X, T, R).

%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 2. a.

direct(X, Y, XDeps, XDur) :- 
train(X, Y, XDeps, XDur, _, _); train(Y, X, _, _, XDeps, XDur).

%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 2. b.

%via(X, Cs, V, Y) :- X = Y.
%via(X, Cs, V, Y) :- 
%mem_rem(X, Cs, Css),
%train(X, Z, _, _, _, _),
%append(V, ["via()"], V),
%via(Z, Css, V, Y).

con(X, Dep, V, Arr, Y, Cs) :- 
train(X, Y, [Dep|_], Dur, _, _), 
Arr is Dep + Dur, 
mem_rem(X, Cs, Css),
mem_rem(Y, Css, Csss),
V = Csss.

% unfinished

%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 2. c.

connection(X, Dep, V, Arr, Y) :- 
mem_rem(X, 
[swansea, cardiff, 
manchester, bristol,
london, brussels,
paris, munich,
vienna, venice], Cs),
con(X, Dep, V, Arr, Y, Cs).

% unfinished


