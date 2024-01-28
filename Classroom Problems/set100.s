;Write an ARM assembly program to set 100 word locations in the memory to set to all ones. Starting from LOC1
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
	
	LDR R0,=LOC1
	MOV R1,#100	;Counter
	
	LDR R2,=0xFFFFFFFF
	
	
loop
	STR R2,[R0],#4

	SUBS R1,#1
	BNE loop
	
	
STOP
	B STOP
	AREA mydata,DATA,READWRITE
LOC1 DCD 0
	END