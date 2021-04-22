.model small    
.stack 100H
.data 

palindrome db 'Yes','$'  
notpalindrome db 'No','$'


string db 10 dup(?)

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax 
    lea si, string
    
    
    string_input:
            mov ah,1
            int 21h      ;the user input hex converted data will be stored in al reigster. user gives 'd' and after the execution of this line the al register will have the value 64h which is the hex value of 'd'
            cmp al,13    ;al=carriage return  ;compares if the value inside al is 'enter' or not. If it's enter that would mean that the word has ended.
            je processing   ;user input has ended so we got to go to the display part where we will start to display
            mov [si],al  ; move the user input charater data as data value into the address the si is pointing to
            inc si
      

    jmp string_input
    
    
    processing:  
    mov [si], '$'
    dec si 
    lea di, string
         comparing:
            mov al, [di]
            cmp [di],'$'  
            je same
                     
            mov al,[si]         
            cmp al,[di]
            jne notsame  
            
            dec si
            inc di
            
            jmp comparing


same:  
mov dl,10
mov ah,2
int 21h

lea dx,palindrome
mov ah,09
int 21h
jmp break       

notsame:
  
mov dl,10
mov ah,2
int 21h

lea dx,notpalindrome
mov ah,09
int 21h
             
break:
hlt         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
     
     
endp main
end main   


