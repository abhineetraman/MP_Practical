.model small
.386
.stack 50h
.data
d1 db 0ah,'enter the size of array',24h
d2 db 0ah,'enter the first array:',24h
d3 db 0ah,'enter the second array:',24h
d4 db 0ah,'Addition of array:',24h
num db 0
arr1 dw 20 dup(?)
arr2 dw 20 dup(?)
arr3 dw 20 dup(?)
.code
start:
        mov ax,@data
        mov ds,ax

        mov dx,offset d1

        mov ah,09h
        int 21h
        mov ah,01h
        int 21h

        sub al,30h
        mov num,al
        mov dx,offset d2
        mov ah,09h
        int 21h
        mov ch,0h
        mov cl,num
        mov si,0
        mov ax,0

l1:
        mov ah,01h
        int 21h
        sub al,30h

        mov arr1[si],ax
        inc si
loop l1
        mov dx,offset d3
        mov ah,09h
        int 21h

        mov si,0
        mov cl,num
        mov si,0
        mov ax,0

l2:
        mov ah,01h
        int 21h
        sub al,30h
        mov arr2[si],ax
        inc si
loop l2
        mov dx,offset d4
        mov ah,09h
        int 21h

        mov cl,num
        mov ch,0h
        mov si,0
    
l3:
        mov bx,0
        mov ax,0
        mov bx,arr1[si]
        mov ax,arr2[si]
        adc ax,bx
        mov arr3[si],ax
        inc si

loop l3
        call output

        mov ah,4ch
        int 21h

output proc near
        mov si,0
        mov cl,num
        mov ch,0h

display:
        mov dx,0h
        mov dx,arr3[si]
        cmp dl,9
        jbe ent

        add dl,37h
        jmp ent1
ent:
        add dl,30h
ent1:
        mov ah,02h
        int 21h

        inc si
loop display
ret
output endp
end start
