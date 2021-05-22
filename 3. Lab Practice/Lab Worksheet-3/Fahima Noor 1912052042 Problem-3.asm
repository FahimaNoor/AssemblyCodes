include 'emu8086.inc'
.model small    
.stack 100H
.data
array db 8,9,0,3,2,5,10,4,5,3
len equ $-array  

maximum db ?  ;uninitialized array 
     
.code 
main proc   
    mov ax, @data 
    mov ds, ax     
    lea si,array 
    mov ch,0  
    
    mov bl,[si]
    mov maximum, bl  ;initializing the variables with the first index value

 
     comparison:  
         cmp ch,len  
         je break:    
            
         mov bl,[si]   
         cmp  maximum, bl
         jl update_maximum     
         back_to_comparison:
             inc ch
             inc si  
     jmp comparison
             
     update_maximum:
         mov maximum, bl
     jmp back_to_comparison 
    
     break:
         mov ah,0 
         mov al, maximum
         call   print_num      ; print number in AX.

    
define_print_num
define_print_num_uns  ; required for print_num.   
endp main
end main   


