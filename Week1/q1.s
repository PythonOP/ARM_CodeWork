;Write an ARM assembly language program to store data into general purpose registers.
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
	LDR R0,=0x33
	LDR R1,=2_10100111
	MOV R2,#0x65
STOP
	B STOP
	END