;Write a ARM assembly program to find the sum of N bytes 
;Considering DCW(half word) nos for this code
	AREA RESET, DATA, READONLY
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
    LDR R0, =ARRAY    
    LDR R1, =RES      
    MOV R2,#0       ;Sum Reg
	MOV R4,#5		;LOOP Reg
      
Loop
	LDR R3, [R0],#2
	ADD R2, R2, R3  ; Accumulate the sum
   
	
    SUBS R4,#1
    BNE Loop
	
	; Store the result in RES
	STR R2, [R1]
STOP
    B STOP

ARRAY DCW 1, 2, 3, 4, 5  

	AREA mydata, DATA, READWRITE
RES DCW 0                    ; Result variable in data memory
	END
