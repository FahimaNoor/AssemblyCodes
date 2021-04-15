.model small    
.stack 100H
.data 

array db 10,9,2,8,6
string1 dw 'Value found','$'  
string2 dw 'Value not found','$'

.code 



     
main proc   
    mov ax, @data 
    mov ds, ax  
    mov ch,0 
    mov al,22
    lea si, array 
    
    looping:
    cmp ch,5
    je not_found 
    
    
    cmp al,[si]
    je found
    
    inc si           
    inc ch           
    jmp looping  
    
    found: 
    lea dx,string1 ;INT 2lh, function 9, expects the offset address of the character string to be In DX.
    mov ah,09
    int 21h  
    jmp break
   
    not_found: 
    lea dx,string2
    mov ah,09
    int 21h    
    

break:   
endp main
end main   


