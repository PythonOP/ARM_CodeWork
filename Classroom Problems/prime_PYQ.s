;Write an ARM assembly language program to check whether a number is prime or not. 
;Store AA in the memory location PRIME if it is a prime number, else store FF. 
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
	
	MOV R0,#17
	CMP R0,#1
	BEQ Prime
	CMP R0,#2
	BEQ Prime
	
	MOV R1,R0
	MOV R2,#2	;Divider
	
	BL Division
STOP
	B STOP
	
Division
	MOV R3,#0
Loop
	CMP R1,R2
	BLT Done
	
	SUB R1,R1,R2
	ADD R3,R3,#1
	B Loop

Done
	; r1 contains the remainder at end
	CMP R1,#0
	BEQ Prime
	BNE NotPrime
	BX LR

Prime
	MOV R4,0xAA
	LDR R5,=PRIME
	STR R4,[R5]
	BX LR
NotPrime
	MOV R4,0xFF
	LDR R5,=PRIME
	STR R4,[R5]
	BX LR
	AREA mydata,DATA,READWRITE
PRIME DCD 0
	END