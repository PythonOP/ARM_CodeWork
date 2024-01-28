;Write a program to
; i> clear R0
; ii> Add 9 to R0 a 1000 times
; iii> Place the sum in R4
; iv> Use the zero flag and BNE instruction in the program
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
	
	MOV R0,#0
	MOV R1,#1000	;Counter

loop
	ADD R0,#9

	SUBS R1,#1
	BNE loop
	
	MOV R0,R4
	
STOP
	B STOP
	END