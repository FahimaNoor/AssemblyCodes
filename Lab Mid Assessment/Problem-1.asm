.model small    
.stack 100H
.data 

data_value db 80h ;data is a negative number
even_string db 'The number is Positive', '$' 
odd_string db 'The number is Negative', '$'   

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax 
    
    mov cl,data_value   ;takes the data into cl register.
    mov al,0h   
    add cl,al
   
    cmp cl,0 
    jg positive
    jl negative
    
    positive: 
    lea dx, even_string ;using dx to load the string saved in data segment
    mov ah, 09h        ;this is a display string function
    int 21H            ;display message
   
    jmp break
  
  
    negative:
    lea dx, odd_string
    mov ah, 09h        ;display string function
    int 21H            ;display message
    jmp break
                
    break:
    
   
    
endp main
end main   


