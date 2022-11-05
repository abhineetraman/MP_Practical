.model small
.386
.stack 50H
.data
d1 db 0AH,'Enter the size of array  :',24H
d2 db 0AH,'Enter the elements of array  :',24H
d3 db 0AH,'Enter element to be searched  :',24H
d4 db 0AH,'Element not found',24H
d5 db 0AH,'Element found at position',24H
p dw ?
n db ?
k db ?
f db ?
l db ?
mid db ?
ARR db 20  dup(?)
.code
 START:
        MOV AX,@data
        MOV DS,AX

        MOV DX,offset d1
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV n,AL

        MOV DX,offset d2
        MOV AH,09H
        INT 21H
        MOV CH,0
        MOV CL,n
        MOV SI,0

        ENTERELEMENTS:

                MOV AH,01H
                INT 21H
                MOV ARR[SI],AL
                INC SI
                LOOP ENTERELEMENTS

        MOV DX,offset d3
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        MOV k,AL

       ; MOV CH,0H
       ; MOV SI,0
            MOV CL,n
            DEC CL
            MOV f,CL
            MOV l,0
       MIDDLE:
                MOV AL,f
                MOV BL,l
                CMP BL,AL
               JA L1
               ADD AL,BL
               MOV DL,2
               MOV AH,00
               DIV DL 
               MOV MID,AL
               MOV AH,00H
               MOV SI,AX


        COMPARE:
                 MOV AH,ARR[SI]
                 CMP k,AH
                 MOV p,SI

                 JZ RESULT
                 JB BELOW
                 JA ABOVE
                 
                ; INC SI
                ; LOOP SEARCH
       BELOW:
             SUB mid,1
             MOV AL,mid
             MOV f,AL
             JMP MIDDLE
       ABOVE:
             ADD mid,1
              MOV AL,mid
              MOV l,AL
              JMP MIDDLE
      l1:
        MOV DX,offset d4
        MOV AH,09H
        INT 21H
        MOV AH,4CH
        INT 21H

        RESULT:
                 MOV DX,offset d5
                 MOV AH,09H
                 INT 21H
                 ADD p,1
                 MOV DX,p
                 ADD DX,30H
                 MOV AH,02H
                 INT 21h
                 MOV AH,4CH
                 INT 21H
 END START
