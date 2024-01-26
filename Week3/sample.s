;Write an assembly program to multiply two 32 bit numbers
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
	
	LDR R1,=VAL1
	LDR R2,=VAL2
	LDR R1,[R1]
	LDR R2,[R2]
	
	UMULL R3,R4,R1,R2   ;R3: Stores lower 32 bits  ;R4: Stores higher 32 bits
	
	LDR R2,=RES
	STR R4,[R2]
	STR R3,[R2,#4]
	
STOP
	B STOP
VAL1 DCD 0x12345678
VAL2 DCD 0x87654321
	
	AREA mydata,DATA,READWRITE
RES DCD 0
	END