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
	MOV R1, #2   ; First number
    MOV R2, #1   ; Second number

    ; Compare the two numbers
    CMP R1, R2

    ; Branch if the first number is greater than or equal to the second number
    MOVGE R0, R1  ; If R1 >= R2, store R1 in R0
    BGE Done

    ; Otherwise, the second number is greater, so store it in R0
    MOV R0, R2
	
Done
	
STOP
	B STOP
SRC DCD 8
	
	AREA mydata,DATA,READWRITE
DST DCD 0
	END