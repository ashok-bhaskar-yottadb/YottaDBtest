V1MAX1	;MAXIMUM RANGE -1-;YS-TS,V1MAX,VALIDATION VERSION 7.1;31-AUG-1987;
	;COPYRIGHT MUMPS SYSTEM LABORATORY 1978
	S PASS=0,FAIL=0
	W !!,"V1MAX1: TEST OF MAXIMUM RANGE -1-",!
619	W !,"I-619  255 characters in one routine line"
	W !!,"I-619.1  write command  (visual)" W:$Y>50 #
	S ITEM="I-619.1  write command  (visual)"
	W !,"   THERE SHOULD APPEAR SIX ""THIS IS MAXIMUM LENGTH LINE. (255CHAR'S)""'S"
LINE	W !!,"THIS IS MAXIMUM LENGTH LINE. (255)",!,"THIS IS MAXIMUM LENGTH LINE. (255)",!,"THIS IS MAXIMUM LENGTH LINE. (255)",!,"THIS IS MAXIMUM LENGTH LINE. (255)",!,"THIS IS MAXIMUM LENGTH LINE. (255)",!,"THIS IS MAXIMUM LENGTH LINE. (255)",!,"END      "
	;
	S ITEM="I-619.2  set command"
	S B="?????????????????????",C="????????????????????????????????????????????????????????????????????",D="????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????",E="????"
	S VCOMP="????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????"
	S VCORR=B_C_D_E_"???????????" D EXAMINER K A,B,C,D,E,F
	;
620	W !!,"I-620  255 characters in one data of lvn"
	S ITEM="I-620  " K A
	S A(255)="" F I=1:1:255 S A(255)=A(255)_1
	S VCOMP=A(255)
	S A="1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
	S VCORR=("1"_A_A)=A(255)_A_A D EXAMINER
	;
621	W !,"I-621  255 characters in one data of gvn"
	S ITEM="I-621  " K ^V1
	K A S A(255)="" F I=1:1:255 S A(255)=A(255)_1
	S ^V1(255)="" F I=1:1:255 S ^V1(255)=^V1(255)_"1"
	S VCOMP=A(255)
	S ^V1(127)="1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
	S VCORR=("1"_^V1(127)_^V1(127))=^V1(255)_^V1(127)_^V1(127) D EXAMINER K A
	;
622	W !,"I-622  numeric range ( 10 power -25 to 10 power 25 )"
	S ITEM="I-622  ",VCOMP=""
	S A=-1E25,B=1E-25,C=999999999E-25,D=.999999999E25
	S A1="-1E25",B1="1E-25",C1="999999999E-25",D1=".999999999E25"
	S VCOMP=A_" "_-B_" "_C_" "_D_" "_(A-A1)_(B-B1)_(C1-C)_(D-D1)
	S VCORR="-10000000000000000000000000 -.0000000000000000000000001 .0000000000000000999999999 9999999990000000000000000 0000" D EXAMINER
	;
623	W !,"I-623  significant digit up to 9 digits"
	S ITEM="I-623.1  local data",VCOMP=""
	S A=-.999999999E25,A1="-.999999999E25",B=-999999999E-25,C=999999999E-25,D=+".999999999E25"
	S VCOMP=A_" "_B_" "_C_" "_D_" "_+A1_" "_(A1+.899999998E25)
	S VCORR="-9999999990000000000000000 -.0000000000000000999999999 .0000000000000000999999999 9999999990000000000000000 -9999999990000000000000000 -1000000010000000000000000" D EXAMINER
	;
	S ITEM="I-623.2  global data",VCOMP=""
	S ^V1=-.999999999E25,^V1(1)=-999999999E-25,^V1(2)=999999999E-25,^V1(3)=+".999999999E25",^V1(4)="-.999999999E25"
	S VCOMP=^V1_" "_^V1(1)_" "_^V1(2)_" "_^V1(3)_" "_+^V1(4)
	S VCORR="-9999999990000000000000000 -.0000000000000000999999999 .0000000000000000999999999 9999999990000000000000000 -9999999990000000000000000" D EXAMINER
	;
END	W !!,"END OF V1MAX1",!
	S ROUTINE="V1MAX1",TESTS=7,AUTO=6,VISUAL=1 D ^VREPORT
	K  K ^V1 Q
	;
EXAMINER	I VCORR=VCOMP S PASS=PASS+1 W !,"   PASS  ",ITEM W:$Y>55 # Q
	S FAIL=FAIL+1 W !,"** FAIL  ",ITEM W:$Y>55 #
	W !,"           COMPUTED =""",VCOMP,"""" W:$Y>55 #
	W !,"           CORRECT  =""",VCORR,"""" W:$Y>55 #
	Q
