.model small
.386
.stack
.data
entr db 'enter the binary value: ','$'
outp db 'ascii equivalent is: ','$'
num dw 000AH
.code
START:
        MOV AX,@data
        MOV DS,AX

        MOV DX,offset entr
        MOV AH,09H
        INT 21H

        CALL INPUT 


   
        MOV DX,offset outp
        MOV AH,09H
        INT 21H
        CALL OUTPUT

        MOV AH,4CH
        INT 21H

        INPUT PROC NEAR
                MOV BX,0000H
                MOV CL,0FH
                MOV CH,10H
                MOV DX,0000H
                L1:
                        MOV AH,01H
                        INT 21H

                        SUB AL,30H
                        MOV DL,AL
                        SHL DX,CL
                        ADD BX,DX
                        MOV DX,0000H
                        DEC CL
                        DEC CH
                        JNZ L1

                        RET
        INPUT ENDP

        OUTPUT PROC NEAR
               MOV SI,offset num
               INC SI
               MOV AX,BX
               MOV CL,04H
               L2:
               MOV DX,0000H
               DIV num
               INC SI
               MOV [SI],DL
               DEC CL
               JNZ L2
               MOV CL,04H
               L3:
               MOV DL,[SI]
               ADD DL,30H
               MOV AH,02H
               INT 21H
               DEC SI
               DEC CL
               JNZ L3
                        RET
        OUTPUT ENDP

end start
