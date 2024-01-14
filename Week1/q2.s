;Write an ARM assembly language program to transfer a 32 bit number from one 
;location in the data memory to another location in the data memory.	
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
	LDR R0, =SRC
	LDR R1, [R0]

	LDR R2, =DST
	STR R1, [R2]
STOP
	B STOP
SRC DCD 0x12345678
	AREA mydata,DATA,READWRITE
DST DCD 0
	END
