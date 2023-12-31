ASSUME CS:CODE,DS:DATA
DATA SEGMENT
MSG1 DB 10,13,"INPUT:$"
MSG2 DB 10,13,"OUTPUT:$"
DATA ENDS
CODE SEGMENT
START:MOV AX,DATA
MOV DS,AX
LEA DX,MSG1
MOV AH,09H
INT 21H
XOR BX,BX
MOV CL,04H
MOV AH,01H
INT 21H
XOR BX,BX
INPUT:CMP AL,0DH
JE LINE
CMP AL,39H
JG LETTER
AND AL,0FH
JMP SHIFT
LETTER:SUB AL,37H
SHIFT:SHL BX,CL
OR BL,AL
INT 21H
JMP INPUT
LINE:MOV AX,BX
MOV CL,0AH
MOV CH,00H
L1:DIV CL
XOR DX,DX
MOV DL,AH
PUSH DX
INC CH
MOV AH,00H
CMP AL,00H
JNZ L1
L2:XOR DX,DX
POP DX
ADD DL,30H
MOV AH,02H
INT 21H
DEC CH
JNZ L2
MOV AH,4CH
INT 21H
CODE ENDS
END START
