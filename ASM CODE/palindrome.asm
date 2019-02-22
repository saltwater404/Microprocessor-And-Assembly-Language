.model small
.data
    m1 db 10,13,'Enter the string: $'
    m2 db 10,13,'String is Palindrome.$'
    m3 db 10,13,'String is not palindrome.$' 
    
    buff db 80
         db 0
         db 80 dup(0)
.code
start:
    mov ax,@data
    mov ds,ax
    mov ah,09h
    mov dx,offset m1
    int 21h
    mov ah,0ah
    lea dx,buff
    int 21h
    lea bx,buff+2
    mov ch,00h
    mov cl,buff+1
    mov di,cx
    
    dec di
    sar cl,1
    mov si,00h
    
    back:
        mov al,[bx+di]
        mov ah,[bx+si]
        cmp al,ah
        jnz last
        dec di
        inc si
        dec cl
        jnz back
        mov ah,09h
        mov dx,offset m2
        int 21h
        jmp ter
        
     last:
        mov ah,09h
        mov dx,offset m3
        int 21h   
        
     ter:
         mov ah,4ch
         int 21h
         end start
        
       