;Write a subroutine program to count odd nos stored from a contigous memory location
	AREA RESET,DATA,READONLY
	EXPORT __Vectors
		
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
		
Reset_Handler
	LDR R0,=NUMS
	MOV R1,#5	;Loop counter
	MOV R3,#0	;Keep track of odds
	
loop
	LDR R2,[R0],#1
	BL COUNTODD
	
	SUBS R1,#1
	BNE loop
STOP
	B STOP
	
COUNTODD
	ADD R2,R2,#1
	CMP R2,#1
	ADDEQ R3,#1
	BX LR

NUMS DCD 1,2,3,4,5
	
	AREA mydata,DATA,READWRITE
DST DCD 0
	END