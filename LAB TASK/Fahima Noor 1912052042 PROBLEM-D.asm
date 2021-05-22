.model small    
.stack 100H
.data 

;array db 5 dup(?)  
array db 1,0,3,4,4,1,10,5,7,8
array2 db 10 dup(?)
.code 

     
main proc   
    mov ax, @data 
    mov ds, ax 
    lea si,array 
    lea di,array2
    mov bl,0  
    mov ch,0
    mov cl,1
    
   ; input:
   ; mov ah,01h
   ; int 21h                 
    
   ; mov [si],al  ; move the user input charater data as data value into the address the si is pointing to
   ; inc si
    ;loop input
    
     looping:
      cmp ch,10
      je break 
      mov al,0
      lea si,array    
          x1:
              cmp al,10
              je x3
              cmp [si],bl
              je update  
              x2:
              inc si
              inc al
          jmp x1 
      x3:    
      inc ch
      inc di 
      inc bl 
      mov cl,1
     jmp looping 
     
update:   
mov [di],cl
inc cl
jmp x2     
     
break:
hlt    
   
endp main
end main   


