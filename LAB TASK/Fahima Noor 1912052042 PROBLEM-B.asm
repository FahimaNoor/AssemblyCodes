.model small    
.stack 100H
.data  

result dw 0


.code 

     
main proc   
    mov ax, @data 
    mov ds, ax  
    
    mov ah,0
    mov al,4
    dec al
    mul al ;result will get stored in ax
   
    mov bx,ax   
    mov al,2
    dec al
    mul al ;result will get stored in ax    
    add ax,bx  
    mov result,ax
    
    mov cx, 0F000H
    mov ds,cx
    mov bx, 0FFFEH 
    mov word ptr ds:[bx], ax  
     
   
endp main
end main   


