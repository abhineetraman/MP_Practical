.model small
.386
.stack 50H
.data

d1 db 0AH,'Enter first Number : ',24H
d2 db 0AH,'Enter second number : ',24H
d3 db 0AH,'Difference of both numbers : ',24H

.code
start:
      mov ax,@data
      mov ds,ax

      mov dx,offset d1
      mov ah,09H
      INT 21H

call input

      mov ebp,ebx
      mov dx,offset d2
      mov ah,09H
      int 21h

call input

      mov dx,offset d3
      mov ah,09H
      int 21h
      cmp ebp,ebx
      jae L1
      mov dl,2dh
      mov ah,02h
      int 21h
      neg ebp
      neg ebx

      L1:
         sub ebp,ebx

         mov ebx,ebp

call output

      mov ah,4ch
      int 21h

input proc near

        mov ebx,00000000H
        mov edx,00000000H
        mov cl,1ch
        mov ch,08h

        L3:
           mov ah,01h

           int 21h
           cmp al,39h
           jbe L4
           sub al,37h
           jmp L5

        L4:
           sub al,30h

        L5:
           mov dl,al

           shl edx,cl
           add ebx,edx
           mov edx,00000000H
           sub cl,04h
           sub ch,01h
          jnz L3
          ret

input endp

output proc near
          mov ebp,0F0000000H
          mov cl,1ch
          mov ch,08h

          L6:
              mov edx,ebx

              and edx,ebp
              shr edx,cl
              cmp dl,09h
             jbe L7
             add dl,37h
             jmp L8

          L7:
              add dl,30h
          L8:
              mov ah,02h
              
              int 21h
              mov al,cl
              mov cl,04h
              shr ebp,cl
              mov cl,al
              sub cl,04h
              sub ch,01h
              jnz L6
              ret

output endp

end start
