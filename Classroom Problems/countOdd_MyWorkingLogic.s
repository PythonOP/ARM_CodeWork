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
    MOV R4, #0          
    LDR R1, =VALS       
    MOV R2, #5         

Count_Odd_Loop
    LDR R3, [R1], #4     

    AND R3, #1           ; Check if the number is odd by performing a bitwise AND with 1
    CMP R3, #1           ; Compare the result with 1
    BEQ Odd_Found        ; If equal, the number is odd

    B Continue_Loop      ; If not equal, continue 

Odd_Found
    ADD R4, R4, #1     

Continue_Loop
    SUBS R2, R2, #1      
    BNE Count_Odd_Loop   

STOP
    B STOP

VALS DCD 3, 7, 1, 4, 5   
END
