.model small
data segment
    msg1 db 10,13,'Enter any string:- $'
    msg2 db 10,13,'Entered string is:- $'     
    msg3 db 10,13,'Converted string is:- $'
    
    p1 label byte
    m1 db 0ffh
    l1 db ?
    p11 db 0ffh dup('$')
    
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
    
    lea dx,p1
    mov ah,0ah
    int 21h  
    
    display msg2
    
    display p11
    
    display msg3  
    
    lea si,p11
    mov cl,l1
    mov ch,0
    
 check:
    cmp [si], 41h
    jb done
    
    cmp [si], 5bh
    jb lwr 
    
    cmp [si],61h
    jb done
    
    cmp [si], 7bh
    jg done
    
  upr:
    sub [si] , 20h
    jmp done   
    
  lwr:
    add [si] , 20h   
   
   done: 
    inc si
    loop check 
    
    display p11
    
    mov ah,4ch
    int 21h
    code ends 
end start

  
  