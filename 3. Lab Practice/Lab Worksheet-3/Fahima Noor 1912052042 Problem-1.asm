.model small    
.stack 100H
.data 

decimal db 11
binary db ?

.code 

     
main proc   
      mov ax, @data 
      mov ds, ax 
    
      mov dl,00000001b       
      mov ah, 0 
      mov al, decimal   
      mov bh, 0h   
      mov bl, 02h 
      mov cl, 7   
      binary_dec:   
          div bl 
          and dl,ah
          mov ah,0
          shl dl,cl 
          or  bh,dl  
          mov dl,00000001b
          dec cl
          cmp al,0
          jz x1 
      jmp binary_dec 
      
      x1:
      mov al,bh
      mov cx,8
      reverse:  
      shl al,1
      rcr bl,1 
      loop reverse 
      mov binary,bl

    exit:
    hlt
            
endp main
end main   


