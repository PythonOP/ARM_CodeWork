;Write a program to add ten 32 bit numbers available in code memory and store 
;the result in data memory.
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
	LDR R0,=VALS
	MOV R1,#10	;Loop counter
	MOV R3,#0	;Counter for add with 0 initialised  	
	
	LDR R4,=RESULT	
LOOP
	LDR R2,[R0],#4
	ADD R3,R3,R2	;Each value added
	
	SUBS R1,#1
	BNE LOOP
	
	STR R3,[R4]		;Stored Back to data memory

STOP
	B STOP
VALS DCD 0x10,0x20,0x30,0x40,0x50,0x60,0x70,0x80,0x90,0x100
	
	AREA mydata,DATA,READWRITE
RESULT DCD 0,0,0,0,0,0,0,0,0,0
	END