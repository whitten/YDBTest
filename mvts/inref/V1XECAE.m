V1XECAE ;IW-YS-TS,V1XECA,MVTS V9.10;15/6/96;XECUTE COMMAND -1-
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1978-1996
 S VCOMP=VCOMP_11 Q
EXTERN S VCOMP=VCOMP_"EX " Q
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
13 S VCOMP=VCOMP_13
