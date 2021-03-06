V1FNL1 ;IW-YS-TS,V1FN,MVTS V9.10;15/6/96;FUNCTION $LENGTH  -1-
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1978-1996
 W !!,"99---V1FNL1: $LENGTH function; $LENGTH(expr)  -1-",!
303 W !,"I-303  expr is string literal"
3031 S ^ABSN="11358",^ITEM="I-303.1  All 95 ASCII printable character, including SP",^NEXT="3032^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$LENGTH("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz !""#$%&'()*+,-./:;<=>?@[\]^_`{|}~")
 S ^VCORR=95 D ^VEXAMINE
 ;
3032 S ^ABSN="11359",^ITEM="I-303.2  ""002""",^NEXT="3033^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L("002"),^VCORR=3 D ^VEXAMINE
 ;
3033 S ^ABSN="11360",^ITEM="I-303.3  strlit contains "" character",^NEXT="3034^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L(""" "" """" """""" """) S ^VCORR=12 D ^VEXAMINE
 ;
3034 S ^ABSN="11361",^ITEM="I-303.4  $L(expr)=255",^NEXT="304^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S X="" F I=1:1:254 S X=X_"1" ;(title corrected in V7.3;20/6/88)
 S ^VCOMP=$L(X)_" "_$L(X_"2"),^VCORR="254 255" D ^VEXAMINE
 ;
304 W !,"I-304  expr is an empty string"
 S ^ABSN="11362",^ITEM="I-304  expr is an empty string",^NEXT="305^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L("") S ^VCORR=0 D ^VEXAMINE
 ;
305 W !,"I-305  expr contains control character"
3051 S ^ABSN="11363",^ITEM="I-305.1  One control character",^NEXT="3052^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S A=$C(0),^VCOMP=$L(A),^VCORR=1 D ^VEXAMINE
 ;
3052 S ^ABSN="11364",^ITEM="I-305.2  All control characters",^NEXT="306^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S A=$C(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,127)
 SET ^VCOMP=$L(A),^VCORR=33 D ^VEXAMINE
 ;
306 W !,"I-306  expr contains operator"
3061 S ^ABSN="11365",^ITEM="I-306.1  + unary operator",^NEXT="3062^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L(+"-123E") S ^VCORR=4 D ^VEXAMINE
3062 S ^ABSN="11366",^ITEM="I-306.2  + binary operator",^NEXT="3063^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L(123.45+"-12E+1") S ^VCORR=4 D ^VEXAMINE
3063 S ^ABSN="11367",^ITEM="I-306.3  _ binary operator",^NEXT="307^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L(123.45_"-12E+1") S ^VCORR=12 D ^VEXAMINE
 ;
307 W !,"I-307  expr contains function"
 S ^ABSN="11368",^ITEM="I-307  expr contains function",^NEXT="308^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L($L(000.11)+9) S ^VCORR=2 D ^VEXAMINE
 ;
308 W !,"I-308  expr is integer"
3081 S ^ABSN="11369",^ITEM="I-308.1  123",^NEXT="3082^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L(123) S ^VCORR=3 D ^VEXAMINE
3082 S ^ABSN="11370",^ITEM="I-308.2  0",^NEXT="3083^V1FNL1,V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L(0) S ^VCORR=1 D ^VEXAMINE
3083 S ^ABSN="11371",^ITEM="I-308.3  -0.0",^NEXT="V1FNL2^V1FN,V1AC^VV1" D ^V1PRESET
 S ^VCOMP=$L(-0.0) S ^VCORR=1 D ^VEXAMINE
 ;
END W !!,"End of 99---V1FNL1",!
 K  Q
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
