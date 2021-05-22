include 'emu8086.inc'
.model small    
.stack 100H
.data   

str db 50 dup(?)
len equ $-str   
str2 db 50 dup(?)
linefeed db 13, 10, "$"  
.code 
    
main proc   
    mov ax, @data 
    mov ds, ax  
    
    lea si, str
    mov dx, len  
    call get_string
    lea di, str2     
    
    checking: 
        cmp [si],0h 
        je exit
        call range
        x1:    
            mov al,[si]
            mov [di],al  
            inc si  
            inc di
    jmp checking  
    
    exit:   
        mov ah, 09               ;to go to new line
        mov dx, offset linefeed
        int 21h 
        lea si, str2  
        call print_string 
    jmp break
    
    range proc
        cmp [si],21H
        jl x1  
        cmp [si],2FH 
        jg x1 
        
        mov al,[si]
        mov [di],al
        inc si 
        inc di 
        
        cmp [si],20h 
        je x1
        mov [di],20h
        inc di    
        jmp checking   
    endp range    
    
break:
hlt 
   
define_get_string
define_print_string    
endp main
end main   