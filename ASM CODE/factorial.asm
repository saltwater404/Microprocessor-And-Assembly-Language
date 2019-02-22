.model small
data segment
    a db 5
    data ends
code segment
    assume ds:data,cs:code
   start:
    mov ax,data
    mov ds,ax
    mov ah,00
    mov al,a
   l1:
    dec a
    mul a
    mov cl,a
    cmp cl,01
    jnz l1
    
    mov ah,4ch
    int 21h
code ends
end start