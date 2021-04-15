.model small    
.stack 100H
.data 
     
nextTerm dw ?
 
.code 

     
main proc 
    mov ax, @data 
    mov ds, ax  
    mov cx, 1 ; ch is counter. this will go till 23 which is more than 8 bits
    mov ax, 0 ;term_1 
    mov bx, 1 ;term_2 
    

   looping:
        cmp cx, 017h ; using cx instead of ch or cl is because at higher values, binary numbers will be more than 8
        je break
            mov dx,0 ; making the dx register empty 
            add dx,ax ;dx= ax+(dx)= ax+(0)= ax
            add dx,bx ;dx= bx+(dx)= bx+(ax)= bx+ax
           
            mov ax,bx ;mov data inside bx into ax so, after this instruction ax+bx
           
            mov bx,dx ;mov data inside dx into bx so, after this instruction ax+bx
            mov nextTerm,ax         ; this is to check whether the answers right or not
        inc cx      ;incrementing the counter(which is the cx register)
       jmp looping
break:   
endp main
end main 
  
   