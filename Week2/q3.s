;Write a program to subtract two 32 bit numbers available in the code memory 
;and store the result in the data memory.
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
	
	LDR R0,=VAL1
	LDR R1,=VAL2
	LDR R2,=RES
	LDR R0,[R0]
	LDR R1,[R1]
	
	SUBS R3,R0,R1	;R3 = R0-R1 (SUBS may or may not affect the flags based on input)
	STR R3,[R2]
STOP
	B STOP
VAL1 DCD 0xFFFFFFFF
VAL2 DCD 0x11111111
	AREA mydata,DATA,READWRITE
RES DCD 0
	END