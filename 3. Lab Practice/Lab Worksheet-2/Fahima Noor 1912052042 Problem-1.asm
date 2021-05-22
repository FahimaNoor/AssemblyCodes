.model small    
.stack 100H
.data  


matrix db 1, 2, 3
       db 4, 5, 6,
       db 7, 8, 9,
       db 10,11,12
       
transpose db 4 dup(?)
          db 4 dup(?)   
          db 4 dup(?)
          
.code 

     
main proc   
    mov ax, @data 
    mov ds, ax 
    mov dl,0
    lea si,matrix
    lea di,transpose 
  
    mov cx,4  
    transposing_1:
    mov al, [si]
    mov [di],al 
    inc si
    inc si
    inc si 
    inc di
    loop transposing_1 
    
     cmp dl,0
     je transposing_2
     
     cmp dl,1
     je transposing_3 
     
     jmp break 
      
     transposing_2:
     lea si,matrix
     inc si  
     mov cx,4 
     mov dl,1
     jmp transposing_1
     
     transposing_3:
     lea si,matrix
     inc si
     inc si 
     mov cx,4 
     mov dl,2
     jmp transposing_1
    
    
    
    
  
break:    
hlt    
    
    
   
endp main
end main   


