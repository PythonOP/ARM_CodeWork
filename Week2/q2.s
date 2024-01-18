;Write a program to add two 128 bit numbers available in code memory and 
;store the result in data memory.
;Hint: Use indexed addressing mode.
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
	LDR R2,=RESULT
	
	MOV R3,#4 ;Loop reg
	MOV R4,#0 ;For Carry
	
LOOP
	LDR R5,[R0],#4 
	LDR R6,[R1],#4
	
	;R7 is the final value
	ADDS R7,R4,R5 	;Add val1 with carry
	MOV R4,#0 		;Again R4 is 0 as carry
	
	ADC R4,#0		;If carry generated from prev operation, store it in R4
	
	ADDS R7,R6		;Add val2 to R7
	ADC R4,#0		;If carry generated after adding val2, store it in R4 
	
	STR R7,[R2],#4	;Store each 32 bit section to location RESULT

	SUBS R3,#1
	BNE LOOP
	
	STR R4,[R2]		;Final Carry stored to location RESULT
	
	;RESULT location supposed to have 0xFFFFF....... (All Fs with Carry 0) based on the input array VAL1 and VAL2
STOP
	B STOP
VAL1 DCD 0x01234567, 0x89abcdef, 0x01234567, 0x89abcdef
VAL2 DCD 0xfedcba98, 0x76543210, 0xfedcba98, 0x76543210 
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END