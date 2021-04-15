.model small    
.stack 100H
.data
linefeed db 13, 10, "$" 

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax  
    
    mov cx, 5
    mov dx, 0 
 
    looping: 
             mov ax,5
             sub ax,cx
             mov bx, ax
             cmp cx,0       
             jne ast   
         back_to_loop:    
            mov ah, 09               ;to go to new line
            mov dx, offset linefeed
            int 21h
            loop looping           ; when you loop, it automatically decrements cx register
            jmp break              ; when cx=0, it does not even enters the loop. Starts executing the next line of code
   
    ast: 
    mov ah, 02h  
    mov dl, '*'
    int 21h
    cmp bx,0
    je back_to_loop
    dec bx
    jmp ast      
   
    break:
                
endp main
end main   


