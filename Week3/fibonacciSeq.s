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
	
	MOV R0,#8	;N
	
	;default 2 cycles of the sequence 
	MOV R1,#0
	MOV R2,#1
	
	LDR R3,=RES
	STR R1,[R3],#4	;Initial 0 stored
	STR R2,[R3],#4	;Initial 1 stored
	
	;Since 2 cycles of the sequence are already stored. We can simply avoid 2 iterations of the loop
	SUB R0,#2
	
	MOV R4,#0	;Temp sum
loop 
	ADD R4,R1,R2
	MOV R1,R2	
	MOV R2,R4

	STR R2,[R3],#4
	

	SUBS R0,#1
	BNE loop
	
STOP
	B STOP
	AREA mydata,DATA,READWRITE
RES DCD 0
	END