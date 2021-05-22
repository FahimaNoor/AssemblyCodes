include 'emu8086.inc' 
.model small    
.stack 100H
.data 
str db 50 dup('$')
len = $-str  
linefeed db 13, 10, "$" 
          
.code 

     
main proc   
    mov ax, @data 
    mov ds, ax       
    lea si,str  
    mov dx,len 
    mov cl,0
   
    call get_string  ;get string from user 
    call new_line
   
    mov ah,01h    ;get input from user
    int 21h 
    mov bl,al 
    call new_line
       
    x1:
    cmp [si],'$'
    je  not_found  
    cmp [si],bl
    je  found
    inc si 
    inc cl
    jmp x1 
    hlt   
     
not_found:
jmp break

found:
mov ah,02h    ;get input from user  
add cl,30h
mov dl,cl
int 21h
jmp break
      
break:
hlt
          
new_line proc   
mov ah, 09               ;to go to new line
mov dx, offset linefeed
int 21h 
ret        
endp new_line  

       
define_get_string
endp main
end main   


