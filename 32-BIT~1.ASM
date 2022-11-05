.model small
.386
.stack 50H
.data

d1 db 0AH,'Enter first Number : ',24H
d2 db 0AH,'Enter second number : ',24H
d3 db 0AH,'Sum of both numbers : ',24H

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
add ebx,ebp
mov dx,offset d3
mov ah,09H
int 21h
call output

mov ah,4ch
int 21h

input proc near
mov ebx,00000000H
mov edx,00000000H
mov cl,1ch
mov ch,08h
L1:
mov ah,01h
int 21h
cmp al,39h
jbe L2
sub al,37h
jmp L3
L2:
sub al,30h
L3:
mov dl,al
shl edx,cl
add ebx,edx
mov edx,00000000H
sub cl,04h
sub ch,01h
jnz L1
ret
input endp

output proc near
jnc L4
mov dl,31h
mov ah,02h
int 21h
L4:
mov ebp,0f0000000H
mov cl,1ch
mov ch,08H
L5:
mov edx,ebx
and edx,ebp
shr edx,cl
cmp dl,09H
jbe L6
add dl,37H
jmp L7
L6:
add dl,30h
L7:
mov ah,02h
int 21h
mov al,cl
mov cl,04h
shr ebp,cl
mov cl,al
sub cl,04H
sub ch,01H
jnz L5
ret
output endp
end start
