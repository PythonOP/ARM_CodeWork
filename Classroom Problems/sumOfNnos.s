;Write a ARM assembly program to find the sum of N nos in code memory
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
	LDR R0,=ARRAY
	LDR R1,=5	;LOOP REG
	LDR R2,=0	;Add and store the value
	
LOOP
	LDR R3,[R0],#4
	ADDS R2,R3
	ADC R2,#0

	SUBS R1,#1
	BNE LOOP
	
	;At the end of the loop R3 register should contain the sum of n nos
STOP
	B STOP
ARRAY DCD 2,1,4,5,2
	END