VVEDOC	;VVEDOC* DRIVER Part-III V.7.1);TS,VVEDOC,VALIDATION VERSION 7.1;31-AUG-1987;
	;COPYRIGHT MUMPS SYSTEM LABORATORY 1987
CRT	S IO="CRT" G START
PRINTER	S IO="PRINTER" G START
START	;
VVEDOC1	D ^VVEDOC1
VVEDOC2	D ^VVEDOC2
VVEDOC3	D ^VVEDOC3
VVEDOC4	D ^VVEDOC4
VVEDOC5	D ^VVEDOC5
VVEDOC6	D ^VVEDOC6
VVEDOC7	D ^VVEDOC7
VVEDOC8	D ^VVEDOC8
	W !!
	I IO="PRINTER" W #
	K IO,I,A
END	;
