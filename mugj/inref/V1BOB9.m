V1BOB9	;BINARY OPERATORS -2.9- (<>=[]);YS-TS,V1BOB,VALIDATION VERSION 7.1;31-AUG-1987;
	;COPYRIGHT MUMPS SYSTEM LABORATORY 1978
	S PASS=0,FAIL=0
	W !!,"V1BOB9: TEST OF BINARY OPERATORS -2.9-  (RELATIONAL: ] )",!
	W !,"string follows (])",!
126	W !,"I-126  expratoms are numlit and numlit"
	S ITEM="I-126.1  123]1" S VCOMP=123]1,VCORR="1" D EXAMINER
	S ITEM="I-126.2  3.0]3" S VCOMP=3.0]3,VCORR="0" D EXAMINER
	S ITEM="I-126.3  00123]1" S VCOMP=00123]1,VCORR="1" D EXAMINER
	S ITEM="I-126.4  00.34]0" S VCOMP=00.34]0,VCORR="0" D EXAMINER
	S ITEM="I-126.5  1234]124" S VCOMP=1234]124,VCORR="0" D EXAMINER
	S ITEM="I-126.6  98788.34]987880" S VCOMP=98788.34]987880,VCORR="0" D EXAMINER
	S ITEM="I-126.7  98788.34]987" S VCOMP=98788.34]987,VCORR="1" D EXAMINER
	;
127	W !,"I-127  expratoms are numlit and strlit"
	S ITEM="I-127.1  987]""987""" S VCOMP=987]"987",VCORR="0" D EXAMINER
	S ITEM="I-127.2  3.1]""3.1ABD""" S VCOMP=3.1]"3.1ABD",VCORR="0" D EXAMINER
	S ITEM="I-127.3  22.56]""22$56""" S VCOMP=22.56]"22$56",VCORR="1" D EXAMINER
	S ITEM="I-127.4  99.2]"" ! """ S VCOMP=99.2]" ! ",VCORR="1" D EXAMINER
	S ITEM="I-127.5  -099.2]""-9 ! """ S VCOMP=-099.2]"-9 ! ",VCORR="1" D EXAMINER
	;
128	W !,"I-128  expratoms are strlit and numlit"
	S ITEM="I-128.1  ""3""]3" S VCOMP="3"]3,VCORR="0" D EXAMINER
	S ITEM="I-128.2  ""3A""]3" S VCOMP="3A"]3,VCORR="1" D EXAMINER
	S ITEM="I-128.3  ""00123""]1" S VCOMP="00123"]1,VCORR="0" D EXAMINER
	S ITEM="I-128.4  ""ABCD""]1" S VCOMP="ABCD"]1,VCORR="1" D EXAMINER
	S ITEM="I-128.5  ""!""""""]0231" S VCOMP="!"""]0231,VCORR="0" D EXAMINER
	S ITEM="I-128.6  +""3E-2A""]-3" S VCOMP=+"3E-2A"]-3,VCORR="1" D EXAMINER
	;
129	W !,"I-129  expratoms are strlit and strlit"
	S ITEM="I-129.1  ""A""]""A""" S VCOMP="A"]"A",VCORR="0" D EXAMINER
	S ITEM="I-129.2  ""AB""]""A""" S VCOMP="AB"]"A",VCORR="1" D EXAMINER
	S ITEM="I-129.3  ""ABC""]""ABC""" S VCOMP="ABC"]"ABC",VCORR="0" D EXAMINER
	S ITEM="I-129.4  ""AAA""]""AA""" S VCOMP="AAA"]"AA",VCORR="1" D EXAMINER
	S ITEM="I-129.5  -""3A""]""-""" S VCOMP=-"3A"]"-",VCORR="1" D EXAMINER
	S ITEM="I-129.6  ""AA""]""AAA""" S VCOMP="AA"]"AAA",VCORR="0" D EXAMINER
	S ITEM="I-129.7  ""AAA""]""aaa""" S VCOMP="AAA"]"aaa",VCORR="0" D EXAMINER
	S ITEM="I-129.8  ""aaa""]""AAA""" S VCOMP="aaa"]"AAA",VCORR="1" D EXAMINER
	;
130	W !,"I-130  empty string on left side"
	S ITEM="I-130.1  """"]""A""" S VCOMP=""]"A",VCORR="0" D EXAMINER
	S ITEM="I-130.2  """"]"".1234""" S VCOMP=""]".1234",VCORR="0" D EXAMINER
	;
131	W !,"I-131  empty string on right side"
	S ITEM="I-131.1  ""A""]""""" S VCOMP="A"]"",VCORR="1" D EXAMINER
	S ITEM="I-131.2  ""%AND""]""""" S VCOMP="%AND"]"",VCORR="1" D EXAMINER
	;
132	W !,"I-132  empty string on both sides"
	S ITEM="I-132  " S VCOMP=""]"",VCORR="0" D EXAMINER
	;
END	W !!,"END OF V1BOB9",!
	S ROUTINE="V1BOB9",TESTS=31,AUTO=31,VISUAL=0 D ^VREPORT
	K  Q
	;
EXAMINER	I VCORR=VCOMP S PASS=PASS+1 W !,"   PASS  ",ITEM W:$Y>55 # Q
	S FAIL=FAIL+1 W !,"** FAIL  ",ITEM W:$Y>55 #
	W !,"           COMPUTED =""",VCOMP,"""" W:$Y>55 #
	W !,"           CORRECT  =""",VCORR,"""" W:$Y>55 #
