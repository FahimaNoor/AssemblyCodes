.model small    
.stack 100H
.data  
matrix db 1, 0, 0 
.code 
     
main proc   
    mov ax, @data 
    mov ds, ax 
    mov dl,0
    lea si,matrix  
    
    mov ah, 01h  ;user input
    int 21h 
    sub al,30h   ;subtract 30h from the input to get the numeric value 
    mov bl,0  ;i=0
    
    looping:    
    x1:        ;outer loop
    cmp bl,al
    je display 
    mov cl,0   ;j=0
        x2:          ;inner loop
            cmp cl,al
            je x3 ; exit the inner loop 
            cmp cl,bl ;compares if the index value is same
            je add_one   
            x4:
            inc si  
            inc cl
            jmp x2
        x3:
        inc bl
        jmp x1
    jmp looping
    

 add_one: 
 mov [si],01h ;moving 1 into the address
 jmp x4
 
 
 
display:
   mov ch,al ;the value in al has to be removed as int instruction will change the value inside al
            mov dx,13     ;carriage return(overwrite the result if not moved to next line)
            mov ah,2
            int 21h  
            mov dx,10     ;new line
            mov ah,2
            int 21h  
 
    
    mov bl,0 
    lea si,matrix  
    identity:    
        x5:        ;outer loop
            cmp bl,ch
            je exit
            mov cl,0   ;j=0
                x6:          ;inner loop
                    cmp cl,ch
                    je x7 ; exit the inner loop    
                    add [si],30h         ;displays the index value
                    mov dl, [si] 
                    mov ah, 02h
                    int 21h 
                    
                    mov dx,32     ;space
                    mov ah,2
                    int 21h        
                    inc si  
                    inc cl
                jmp x6
            x7:
            inc bl 
            mov dx,13     ;carriage return(overwrite the result if not moved to next line)
            mov ah,2
            int 21h  
            mov dx,10     ;new line
            mov ah,2
            int 21h   
            jmp x5    
               
    jmp identity

    
exit:    
hlt      
endp main
end main 