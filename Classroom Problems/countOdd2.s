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
	; Count the number of odd numbers from VALS
	; If VALS 1,2,3,4,5
	; R4 should have 3 at the end of the program
	
	LDR R0, =VALS       
	MOV R2, #5          ; Set loop counter to 5
	MOV R4, #0          ; Initialize odd counter to 0

LOOP
	LDR R1, [R0], #4    ; Load the next word (4 bytes) 
	MOVS R3, R1, LSR #1 
	BCC Inc_Odd         
	B Continue
	
Inc_Odd	
	ADD R4, R4, #1      ; Increment the odd counter
	
	
Continue
	SUBS R2, R2, #1     
	BNE LOOP  
STOP
    B STOP

VALS DCD 5, 5, 3, 4, 5   ; Array of numbers
END