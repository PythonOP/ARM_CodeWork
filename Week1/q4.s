;Reverse an array of ten 32 bit numbers in the memory.
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
	;Code
	LDR R0,=SRC
	LDR R1,=DST
	MOV R2,#10  ;Number of items to iterate 
	MOV R3,#36 ;Pointing to last value of SRC(item pointer)
	;Formula: (n*4)-4
	;If n=11 (11 items)
	;Update R3 by (11*4)-4 = 40
	
UP
	LDR R4,[R0,R3]
	SUB R3,#4 		;Decrement SRC item pointer
	STR R4,[R1],#4
	
	SUBS R2,#1
	BNE UP
STOP
	B STOP
SRC DCD 1,2,3,4,5,6,7,8,9,10
	
	AREA mydata,DATA,READWRITE
DST DCD 0,0,0,0,0,0,0,0
	END