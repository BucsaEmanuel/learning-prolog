parent(pam, bob).			% Pam is the parent of Bob
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).				% Pam is a female
female(liz).
female(pat).
female(ann).
male(tom).					% Tom is a male
male(bob).
male(jim).

/*
	This is a rule.
	Left side is the head, or the 
	conclusion
	Right side is the body, or the
	condition
	Read this like a backwards if.
*/
different(X, Y) :- X \= Y.

offspring(Y, X) :- 			% Y is an offspring of X if
	parent(X, Y).			% X is a parent of Y

mother(X, Y) :- 			% X is the mother of Y if
	parent(X, Y), 			% X is a parent of Y and
	female(X).				% X is female

grandparent(X, Z) :- 		% X is a grandparent of Z if
	parent(X, Y), 			% X is a parent of Y and
	parent(Y, Z).			% Y is a parent of Z.

sister(X, Y) :-				% X is a sister of Y if
	parent(Z, X),			
	parent(Z, Y),			% X and Y have the same parent and
	female(X),				% X is female and
	different(X, Y).		% X and Y are different

brother(X, Y) :-
	parent(Z, X),
	parent(Z, Y),
	male(X),
	different(X, Y).

aunt(X, Y) :- 
	female(X),
	sister(X, T),
	parent(T, Y).

uncle(X, Y) :- 
	male(X),
	brother(X, T),
	parent(T, Y).

happy(X) :-
	parent(X, Y),
	offspring(Y, X),
	different(X, Y).

hastwochildren(X) :-
	parent(X, Y),
	parent(X, Z),
	sister(Z, Y),
	different(Z, Y).

grandchild(Y, Z) :-
	parent(T, Y),
	parent(Z, T).

predecessor(X, Z) :-		% Rule pr1: X is a predecessor of Z
	parent(X, Z).

predecessor(X,Z) :-			% Rule pr2: X is a predecessor of Z
	parent(X, Y),
	predecessor(Y, Z).

somebody_has_a_child(X) :-
	parent(X, _).


date(1, may, 1990).
date(2, may, 1990).
date(3, may, 1990).
date(4, may, 1990).

day_of_date(X) :-
	date(X, _, _).
	

get_date(X, Y, Z) :-
	date(X, Y, Z).