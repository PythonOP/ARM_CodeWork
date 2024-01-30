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

    MOV32 R0, #0x12345678

 
    MOV R1, R0, LSR #28     
    AND R1, R1, #0xF        ; Mask to get only the BCD digit

    MOV R2, R0, LSR #24     ; Extract the second digit
    AND R2, R2, #0xF

    MOV R3, R0, LSR #20     ; Extract the third digit
    AND R3, R3, #0xF

    MOV R4, R0, LSR #16     ; Extract the fourth digit
    AND R4, R4, #0xF

    MOV R5, R0, LSR #12     ; Extract the fifth digit
    AND R5, R5, #0xF

    MOV R6, R0, LSR #8      ; Extract the sixth digit
    AND R6, R6, #0xF

    MOV R7, R0, LSR #4      ; Extract the seventh digit
    AND R7, R7, #0xF

    MOV R8, R0              ; Extract the eighth digit (LSB)
    AND R8, R8, #0xF



STOP
    B STOP

    END
