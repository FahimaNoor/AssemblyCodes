.model small    
.stack 100H
.data 

.code 
arr db 5,2,8,9,12,3,1,6,13,15,7,10   
len equ $-arr
zeros db 5 dup(?)
ones db 5 dup(?)
twos db 5 dup(?)  


     
main proc   
    mov ax, @data 
    mov ds, ax    
    
    lea si, arr
    lea di, zeros
    lea bx, ones
    mov ch,0 ;counter
    
    looping:
     cmp ch,len
     je twos_loop       
        mov ah,0
        mov cl,03h
        mov al,[si]
        div cl
        
        cmp ah,0
        je insert_to_zeros        
        cmp ah,1
        je insert_to_ones

        
        back_to_looping:
        inc si  
        inc ch    
    jmp looping  
    
    insert_to_zeros: 
    mov al, [si]
    mov [di],al
    inc di
    jmp back_to_looping  
   
    insert_to_ones:
    mov al, [si]
    mov [bx],al
    inc bx      
    jmp back_to_looping    
   
    twos_loop: 
        mov ch,0 ;counter 
        lea si, arr
        lea bx, twos    
        looping_1:
            cmp ch,len
            je break       
           
            mov ah,0
            mov cl,03h
            mov al,[si]
            div cl
            
            cmp ah,2
            je insert_to_twos      
                    
            back_to_looping1:
            inc si  
            inc ch    
        jmp looping_1   
    
    insert_to_twos:
    mov al, [si]
    mov [bx],al
    inc bx      
    jmp back_to_looping1    
    
    
    
break:   
endp main
end main   


