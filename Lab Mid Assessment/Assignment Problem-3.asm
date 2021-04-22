.model small    
.stack 100H
.data
array db 8,9,0,3,2,5,5,4,5,0
len equ $-array  
                                
minimum db ?  ;uninitialized array  
maximum db ?
     
     
     
.code 
main proc   
    mov ax, @data 
    mov ds, ax     
    lea si,array 
    mov ch,0  
    
    mov bl,[si]
    mov minimum, bl  ;initializing the variables with the first index value
    mov maximum, bl  ;initializing the variables with the first index value

 
    comparison:  
         cmp ch,len  
         je break:    
            
         mov bl,[si]
         cmp  minimum, bl
         jg update_minimum
            
         cmp  maximum, bl
         jl update_maximum 
            
         back_to_comparison:
             inc ch
             inc si
            
     jmp comparison
 
         
     update_minimum:
        mov minimum, bl
     jmp back_to_comparison      
                       
                       
     update_maximum:
        mov maximum, bl
     jmp back_to_comparison 
     
     break:
    
   
endp main
end main   


