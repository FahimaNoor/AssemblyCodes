;the problem is solved using registers like di,si,bx instead of indexe variables
.model small    
.stack 100H
.data   

array db 6,3,1,4,0,8,9,2,7,5  
len equ $-array 
 
even_array db 5 dup(?)  
odd_array db 5 dup(?)    

.code          
main proc   
    mov ax, @data  
    mov ds, ax 
    lea si, array       
    lea di, even_array  
    lea bx, odd_array   
    mov ch, 0 
     
    looping:  
       cmp ch, len    
        je break       
               mov cl, 02h  
               mov ah, 0    
               mov al,ch  
               div cl       
             
              cmp ah,0          
                je  pushToEvenArray             
                jne pushToOddArray    
              
              to_looping:
              inc si 
              inc ch
                             
      jmp looping   
    
      pushToEvenArray:
        mov al,[si]   
        mov [di],al   
        inc di    
      jmp to_looping           
      
      pushToOddArray:
        mov al,[si]   
        mov [bx],al     
        inc bx 
      jmp to_looping
                    
      break:

endp main
end main   


