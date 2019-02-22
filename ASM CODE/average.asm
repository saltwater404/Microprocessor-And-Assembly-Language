.model small
.stack 100
.data
    no1 db 63h
    no2 db 2eh
    avg db ?
    
.code 
    start:
        mov ax,data
        mov ds,ax
        
        mov al,no1
        add al,no2
        adc ah,00h
        sar ax,1
        mov avg,al
        
        end start
        