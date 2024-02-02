; Write an ARM assembly program to convert a single hex digit to its ASCII equivalent
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
	LDR R0,=Digit
	LDR R1,=Result
	LDR R2,[R0]
	
	CMP R2,#0xA	;check if the number is less than 10 decimal
	BLT Add_0
	
	ADD R2,R2, #"A"-"0"-0xA		;add offset for 'A' to 'F'

Add_0
	ADD R2,R2,#"0"
	STR R2,[R1]
	
STOP
	B STOP
Digit DCD 0x01
	AREA mydata,DATA,READWRITE
Result DCD 0
	END