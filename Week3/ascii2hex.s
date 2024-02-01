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
    ; Write Code here

    ; Example: Hexadecimal value 0x34
    MOV R0, #0xA  ; Replace with your hexadecimal value

	ADD R0,R0,#0xF
    ADD R1, R0, #'0'      ; Convert to ASCII

    ; R1 now contains the ASCII representation of the least significant digit

STOP
    B STOP

    END
