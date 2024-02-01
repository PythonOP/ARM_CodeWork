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

    MOV R0, #0x45  ; 2-digit hex number

    ; Convert the first hexadecimal digit to ASCII
    MOV R1, R0, LSR #4     ; Shift right by 4 bits to get the most significant nibble
    AND R1, R1, #0xF       ; Mask to get only the hexadecimal digit
    ADDS R1, R1, #'0'       ; Convert to ASCII

    ; Convert the second hexadecimal digit to ASCII
    MOV R2, R0, LSL #28    ; Shift left by 28 bits to get the least significant nibble
    LSR R2, R2, #28        ; Shift right to align the nibble
    AND R2, R2, #0xF       ; Mask to get only the hexadecimal digit
    ADDS R2, R2, #'0'       ; Convert to ASCII

    ; R1 and R2 now contain the ASCII representation of the two hexadecimal digits

STOP
    B STOP

    END
