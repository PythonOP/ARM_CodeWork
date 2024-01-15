;Write an ARM assembly language program to transfer block of ten 32 bit numbers 
;from code memory to data memory when the source and destination blocks are 
;non-overlapping
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
	;My Code
	LDR R0,=SRC
	LDR R1,=DST
	MOV R2,#10 ;Counter
	
UP
	LDR R4,[R0],#4
	STR R4,[R1],#4
	SUBS R2,#1     ;Decrement R2 by 1 till Z flag is equal to 0
	BNE UP ;Branch if z=0

STOP
	B STOP
SRC DCD 1,2,3,4,5,6,7,8,9,10
	
	AREA mydata,DATA,READWRITE
DST DCD 0
	END