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
    LDR R3, [R1], #4     ; Load the next word from the VALS array into R3 and increment R1

    AND R3, R3, #1       ; Check if the number is odd by performing a bitwise AND with 1
    CMP R3, #1           ; Compare the result with 1
    BEQ Inc_odd

    B Continue      ; If not equal, continue 

Inc_Odd
    ADD R4, R4, #1       

Continue
    SUBS R2, R2, #1      
    BNE Count_Odd_Loop   

    ; R4 now contains the count of odd numbers in the VALS 

STOP
    B STOP

VALS DCD 1, 2, 3, 4, 5   ; Array of numbers
END
