;Write a arm subroutine to find factorial of a number
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
	MOV R0,#5	;N
	;5*4*3*2*1 = 120
	MOV R1,#1	;Stores result
	
	BL FACTORIAL
	
STOP
	B STOP

FACTORIAL
loop
	MUL R1,R0
	SUBS R0,#1
	BNE loop
	BX LR

	END