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
	MOV R0,#11 ;Value to check 
    AND R2, R0, #1      ; Perform bitwise AND with 1 to check the least significant bit

    CMP R2, #0          
    BEQ IsEven          
    B IsOdd             

IsEven
	MOV R4,#1
    B STOP

IsOdd
	MOV R4,#2

	
STOP
	B STOP
	END