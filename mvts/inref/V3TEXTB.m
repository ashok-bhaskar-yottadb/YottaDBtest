 ;V3TEXTB ;IW-KO-YS-TS,V3TEXT,MVTS V9.10;15/6/96;PART-90
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1990-1996
A S ^VCOMP=123 ;TEXT
0 S B=1 ;COMMENT
00000 S A=0 ;ABC
010 S B=1 ;0+2
01 S B=12
11 ;ERROR
1 ;S C=34 ;;;;;;ROUTINE
ABCDEFGI S A=1234 ;ABCD
ABCDEFGH S A=123 ;ABC
ABCDEFGG S A=1234 ;ABCD
 ;
 Q
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
