;Write a program that will count the number of characters in a string.    

;works correctly but written badly as it's not easy to understand how the length is being found out

.model small    
.stack 100H
.data    

str db 'Hello'  
length db ?

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax
    lea si, str  
    lea di, str
     
   checking:
        cmp [si],0
        je  break  
        jne increment
        
   increment:
   mov al, [si]  
   inc si  
   jmp checking 
   
   
   
   break: 
   
endp main
end main   


