.model small
.386
.stack 50H
.data
d1 db 0AH,'Enter the size of array: ',24H
d2 db 0AH,'Enter the first array: ',24H
d3 db 0AH,'Enter the second array: ',24H
d4 db 0AH,'subtraction of array ',24H
num db 0
arr1 dw 20 dup(?)
arr2 dw 20 dup(?)
arr3 dw 20 dup(?)
.code
start:
        MOV AX,@data
        MOV DS,AX

        MOV DX,offset d1

        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H

        SUB AL,30H
        MOV num,AL

        MOV DX,offset d2

        MOV AH,09H
        INT 21H

        MOV CH,0H
        MOV CL,num
        MOV SI,0
        MOV AX,0H
L1:
        MOV AH,01H
        INT 21H

        SUB AL,30H

        MOV arr1[SI],AX
        INC SI
LOOP L1
        MOV DX,offset d3
        MOV AH,09H
        INT 21H

        MOV CH,0H
        MOV CL,num
        MOV SI,0
        MOV AX,0
L2:
        MOV AH,01H
        INT 21H

        SUB AL,30H

        MOV arr2[SI],AX
        INC SI
LOOP L2
        MOV DX,offset d4
        MOV AH,09H
        INT 21H

        MOV CL,num
        MOV CH,0H
        MOV SI,0
L3:
        MOV BX,0
        MOV AX,0
        MOV BP,0
        MOV BX,arr1[SI]
        MOV AX,arr2[SI]
        CMP BX,AX
        JB L4
        SUB BX,AX
        JMP L5
L4:
        MOV BP,AX
        MOV DX,0
        MOV DL,2DH
        MOV AX,0
        MOV AH,02H
        INT 21H

        SUB BP,BX

        MOV DX,0
        MOV DX,BP

        ADD DL,30H
        MOV AH,02H
        INT 21H
        JMP L6
L5:
        MOV AX,0
        MOV DX,0
        MOV DX,BX
        ADD DL,30H
        MOV AH,02H
        INT 21H
L6:
        INC SI
LOOP L3
        MOV AH,4CH
        INT 21H
END START
