ASSUME CS: CODE, DS: DATA

DATA SEGMENT
	NUM1 DW 00FFH
	NUM2 DW 00FFH
	PROL DW 1 DUP(?)
	PROH DW 1 DUP(?)
DATA ENDS

CODE SEGMENT
START:	MOV AX, DATA
		MOV DS, AX
		
		MOV AX, NUM1
		MOV BX, NUM2
		MUL BX
		MOV PROL, AX
		MOV PROH, DX
		
		MOV AH, 4CH
		INT 21H
CODE ENDS
END START		
				
