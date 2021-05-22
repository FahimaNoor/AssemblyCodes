.model small    
.stack 100H
.data 
ones db ?
.code 
  
main proc   
    mov ax, @data 
    mov ds, ax         
    mov cx,8  
    mov al, 00010001b  
    mov dl,0    
    binary: 
    mov bl, 00000001b  
    and bl,al
    cmp bl,01h   
    je increment 
    x1:
    shr al,1
    loop binary 
    
    mov ones,dl    ;will contain the number of ines in binary string
    hlt
    
    increment:
    inc dl   
    jmp x1
   
   
endp main
end main   


