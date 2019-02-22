data segment
    str1 db "Faisal$"
    str2 db 7 dup ('$')
    msg1 db 10,13,'Stored string in memory: $'
    msg2 db 10,13,'Reversed String: $'  
    data ends
display macro msg
    mov ah,9
    lea dx,msg
    int 21h
endm

code segment
    assume cs:code,ds:data
    
    start:
        mov ax,data
        mov ds,ax
        display msg1
        display str1       
        lea si, str2
        lea di, str1   
        add di,5
        mov cx,6
        
     reverse:
        mov al,[di]
        mov [si],al
        inc si
        dec di
        loop reverse  
        display msg2
        display str2
        
        mov ah,4ch
        int 21h
        code ends
end start