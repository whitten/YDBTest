V3NEWMF3 ;IW-KO-YS-TS,V3NEW,MVTS V9.10;15/6/96;
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1990-1996
 W !!,"103---V3NEWMF3: NEW -33-"
 ;
69 S ^ABSN="30976",^ITEM="III-0976  FOR I=1:1:5 ... NEW  ...  GOTO"
 S ^NEXT="70^V3NEWMF3,V3NEWMF4^V3NEW,V3ALDO^VV3" D ^V3PRESET K
 S ^VCOMP=""
 S A="A",A(1)="A(1)",A(2)="A(2)",A(3)="A(3)",A(4)="A(4)",A(5)="A(5)",B="B",B(2)="B(2)",C="C",C(2)="C(2)"
 D NEWF7,CHECK
 S ^VCORR="111111/11 0 1 0 0 0 1 0 10 1 11 1 aa(2)bc(2)dd(2)#11 1 1 1 1 1 11 1 11 1 0 0 A123A(4)A(5)BB(2)CC(2)#"
 D ^VEXAMINE
 ;
70 S ^ABSN="30977",^ITEM="III-0977  FOR  ... NEW A,C ...  GOTO"
 S ^NEXT="71^V3NEWMF3,V3NEWMF4^V3NEW,V3ALDO^VV3" D ^V3PRESET K
 S ^VCOMP=""
 S A="A",A(2)="A(2)",B="B",B(2)="B(2)",C="C",C(2)="C(2)"
 D NEWF8,CHECK
 S ^VCORR="111111/10 0 1 0 0 0 11 1 11 1 11 1 a(2)bb(2)cc(2)dd(2)#11 1 1 0 0 0 11 1 11 1 11 1 A1A(2)bb(2)CC(2)dd(2)#"
 D ^VEXAMINE
 ;
71 S ^ABSN="30978",^ITEM="III-0978  FOR  ... NEW (B) ...  GOTO"
 S ^NEXT="^V3NEWMF4,V3NEWT1^V3NEW,V3ALDO^VV3" D ^V3PRESET K
 S ^VCOMP=""
 D NEWF9,CHECK
 S ^VCORR="000/11 0 1 0 0 0 1 0 10 1 11 1 aa(2)bc(2)dd(2)#10 1 1 0 0 0 1 0 0 0 0 0 12b#"
 D ^VEXAMINE K ^VV
 ;
END W !!,"End of 103 --- V3NEWMF3",!
 K  K ^VV Q
 ;
NEWF7 ;
 S ^VCOMP=^VCOMP_$D(A)_$D(B)_$D(C)_"/"    ;111111/
 F I=1:1:5 S A(I)=I s ^VV=I NEW:I>2  GOTO:^VV>4 NEWF71 s I=^VV
 S ^VCOMP=^VCOMP_"ERROR"
NEWF71 S A="a",A(2)="a(2)",B="b",C(2)="c(2)",D="d",D(2)="d(2)"
 D CHECK
 Q
 ;
NEWF8 ;
 S ^VCOMP=^VCOMP_$D(A)_$D(B)_$D(C)_"/"    ;111111/
 S I=1 F  S A(I)=I N A,C S I=I+1 I I=4 G NEWF81
 S ^VCOMP=^VCOMP_"ERROR"
NEWF81 S A(2)="a(2)",B="b",B(2)="b(2)",C="c",C(2)="c(2)",D="d",D(2)="d(2)"
 D CHECK
 Q
 ;
NEWF9 ;
 S ^VCOMP=^VCOMP_$D(A)_$D(B)_$D(C)_"/"    ;000/
 S I=1 F  S A(I)=I S ^VV=I n:I#2=0 (B) S I=^VV+1 g:I=5 NEWF91
 S ^VCOMP=^VCOMP_"ERROR"
NEWF91 S A="a",A(2)="a(2)",B="b",C(2)="c(2)",D="d",D(2)="d(2)"
 D CHECK
 QUIT
 ;
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
 ;
CHECK S ^VCOMP=^VCOMP_$D(A)_" "_$D(A(1))_" "
 S ^VCOMP=^VCOMP_$D(A(2))_" "_$D(A(3))_" "
 S ^VCOMP=^VCOMP_$D(A(4))_" "_$D(A(5))_" "
 S ^VCOMP=^VCOMP_$D(B)_" "_$D(B(2))_" "
 S ^VCOMP=^VCOMP_$D(C)_" "_$D(C(2))_" "
 S ^VCOMP=^VCOMP_$D(D)_" "_$D(D(2))_" "
 I $D(A)#10=1    S ^VCOMP=^VCOMP_A
 I $D(A(1))#10=1 S ^VCOMP=^VCOMP_A(1)
 I $D(A(2))#10=1 S ^VCOMP=^VCOMP_A(2)
 I $D(A(3))#10=1 S ^VCOMP=^VCOMP_A(3)
 I $D(A(4))#10=1 S ^VCOMP=^VCOMP_A(4)
 I $D(A(5))#10=1 S ^VCOMP=^VCOMP_A(5)
 I $D(B)#10=1    S ^VCOMP=^VCOMP_B
 I $D(B(2))#10=1 S ^VCOMP=^VCOMP_B(2)
 I $D(C)#10=1    S ^VCOMP=^VCOMP_C
 I $D(C(2))#10=1 S ^VCOMP=^VCOMP_C(2)
 I $D(D)#10=1    S ^VCOMP=^VCOMP_D
 I $D(D(2))#10=1 S ^VCOMP=^VCOMP_D(2)
 S ^VCOMP=^VCOMP_"#"
