BUG40	;SIMULATE NEW PROBLEM IN MF4
	S X=0
	N (A,B,X)
	W "POINT 0",?10,$D(X) W:$D(X) ?20,X W !
	D PROC
	W "POINT 1",?10,$D(X) W:$D(X) ?20,X W !
	Q
PROC	G ENTRY^bug40a
