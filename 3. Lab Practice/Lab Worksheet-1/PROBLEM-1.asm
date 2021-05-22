.model small    
.stack 100H
.data 

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax  
    
    ;Multiplication
    mov al,4
    mov bl,2
    mul bl   ;result will get stored in ax
    
    mov cx,0F000H  ;address
    mov ds,cx
    mov bx,0f000H
    mov word ptr ds:[bx], ax ;will store the value in 0F000:0F000 
    
    
    ;Division 
    mov ax,0  ;division of 8-bit occurs with ax 
    mov al, 11
    mov bl, 2
    div bl  ;quotient gets stored in al and remainder in ah

    mov cx,0F000H  ;last even address
    mov ds,cx
    mov bx,0FFFEH
    mov byte ptr ds:[bx], ah  ;will store the remainder in the 0F000:0FFFE 
    
    inc bx  ;will go to the next offset address
    mov byte ptr ds:[bx], al  ;will store the quotient 0F000:0FFFF

endp main
end main   


