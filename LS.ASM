.model small
.386
.stack 50H
.data
d1 db 0AH,'Enter The Size Of The Array: ',24H
d2 db 0AH,'Enter The Array Elements: ',24H
d3 db 0AH,'Enter The Element To Be Searched: ',24H
d4 db 0AH,'Element Not Found: ',24H
d5 db 0AH,'Element Found At Position: ',24H
n db ?
p dw ?
k db ?
arr db 20 dup(?)
.code
start:
        MOV AX,@data
        MOV DS,AX
        MOV DX,OFFSET d1

        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV n,AL

        MOV DX,OFFSET d2
        MOV AH,09H
        INT 21H

        MOV CH,0H
        MOV CL,n
        MOV SI,0

Entering:

        MOV AH,01H
        INT 21H
        MOV arr[SI],AL
        INC SI

LOOP Entering

        MOV DX,OFFSET d3
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        MOV k,AL

        MOV CH,0
        MOV CL,n
        MOV SI,0

Compare:

        MOV AL,arr[SI]
        CMP AL,k
        MOV p,SI
        JZ Result
        INC SI

LOOP Compare

        MOV DX,OFFSET d4
        MOV AH,09H
        INT 21H

        MOV AH,4CH
        INT 21H

Result:

        MOV DX,OFFSET d5
        MOV AH,09H
        INT 21H

        ADD p,1
        ADD p,30H
        MOV DX,p

        MOV AH,02H
        INT 21H

        MOV AH,4CH
        INT 21H

END START
