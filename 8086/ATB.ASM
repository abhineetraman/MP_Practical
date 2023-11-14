.model small
.386
.stack 50H
.data
d1 db 0AH,'Enter ASCII number  :',24H
d2 db 0AH,'binary number is :',24H
ARR db 8 dup(?),'$'

.code
start:
MOV AX,@data
MOV DS,AX

MOV DX,offset d1
MOV AH,09H
INT 21H

CALL input

input proc NEAR
 MOV AH,01H
 INT 21H
 MOV AH,0
 MOV DL,2
 MOV SI,7
 input ENDP

 BINARY:
  DIV DL
 ADD AH,30H
 MOV ARR[SI],AH
 CMP SI,0
 JZ OUTPUT
 MOV AH,0
 DEC SI
 JMP BINARY


 output PROC NEAR
 MOV AH,02H
 MOV DL,13
 INT 21H
 MOV DL,10
 INT 21H
 MOV AH,09H
 MOV DX,offset d2
 INT 21H
 MOV DX,offset ARR
 INT 21H
 MOV AH,4CH
 INT 21H
 output ENDP
 END START
