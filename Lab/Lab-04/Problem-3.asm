.model small    
.stack 100H
.data 

ispalindrome db 'Yes','$'      
isnotpalindrome db 'No','$'    ; LEA stands for LOAD EFFECTIVE ADDRESS and it loads the effective address of second element into the first element. 

.code 
;incomplete
     
main proc   
    mov ax, @data 
    mov ds, ax   
    mov ch,0
    
    input:
    
    cmp al,0d  ; ASCII VALUE FOR ENTER KEY IS 0D
    
    
    jmp input
    
    looping:        
   
    jmp notpalindrome
    
    
    cmp 0Ah, [si]
    
    jmp palindrome
    
    inc ch
    jmp looping 

palindrome:

lea dx,ispalindrome  
mov ah,09
int 21
jmp break
notpalindrome: 

lea dx,isnotpalindrome  
mov ah,09
int 21


break:  
endp main
end main   


