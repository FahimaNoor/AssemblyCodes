.model small    
.stack 100H
.data 
.code 

     
main proc 
    mov ax, @data 
    mov ds, ax    
    mov dx,0 ; making the dx register empty   
    mov cx,0f000H  ;address
    mov ds,cx
    mov bx,0000H    
    
    mov ax, 0
    mov word ptr ds:[bx], ax ;term_1    
    inc bx  
    
    mov ax, 1
    mov word ptr ds:[bx], ax ;term_2      
    
    mov cx,23 
    mov bx,00000H    
   Fibonacci: 
   mov ax, word ptr ds:[bx]      
            add dx,ax   
            inc bx 
            mov ax, word ptr ds:[bx]                 
            add dx,ax
            
            inc bx   
            mov word ptr ds:[bx], dx 
            mov dx,0
            dec bx                        
   loop Fibonacci 

       
break:   
endp main
end main 
  
   