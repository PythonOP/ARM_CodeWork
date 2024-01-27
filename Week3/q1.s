;Write an assembly language program to implement division by repetitive subtraction. 	
	AREA RESET, CODE, READONLY
	EXPORT __Vectors

__Vectors
    DCD 0x10001000
    DCD Reset_Handler
    ALIGN

	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
    MOV R2, #19       ; Divisor
    MOV R3, #9        ; Dividend

    ; Init q and rem 
    MOV R4, #0        ; Q
    MOV R5, #0        ; Rem

Loop
    CMP R2, R3     ; Compare dividend with divisor
    BLT Done       ; Branch if the dividend is less than the divisor

    SUB R2, R2, R3  ; Subtract divisor from dividend
    ADD R4, R4, #1  ; Increment quotient
	B Loop   

Done

    LDR R0, =Quotient
	STR R4, [R0]

    LDR R0, =Remainder
    STR R2, [R0]

STOP
    B STOP

	AREA mydata, DATA, READWRITE
Quotient DCD 0            
Remainder DCD 0          

	END
