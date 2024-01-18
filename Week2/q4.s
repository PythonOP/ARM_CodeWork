;Write a program to subtract two 128 bit numbers available in the code memory 
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
	;Write Code here
	LDR R0,=VAL1
	LDR R1,=VAL2
	LDR R2,=RES
	
	MOV R3,#0	;Inialize carry to 0
	MOV R4,#4	;LOOP reg
	
LOOP
	LDR R5,[R0],#4
	LDR R6,[R1],#4
	
	SUBS R7,R5,R6	;Subtract with borrow
	SBC R7,R7,R3	;Carry update
	
	STR R7,[R2],#4


	SUBS R4,#1
	BNE LOOP	
	
STOP
	B STOP
VAL1 DCD 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
VAL2 DCD 0x11111111,0x11111111,0x11111111,0x11111111	
	AREA mydata,DATA,READWRITE
RES DCD 0,0,0,0
	END