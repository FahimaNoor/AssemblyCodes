.model small    
.stack 100H
.data 

.code     
arr db 5,2,8,9,12,3
len equ $-arr

     
main proc   
    mov ax, @data 
    mov ds, ax     
    mov ch, 0 ; counter
    lea si, arr
    mov dh, 0
    mov dl, 0 
    mov cl, 02h  
    
    looping:
        cmp ch,len 
        je break  
            
            mov ah,0
            mov al,[si]
            div cl    
            
            cmp ah,0
            je  even
            jne odd  
      back_to_looping:
        inc ch
    jmp looping 
    
    even:
        add dl,arr[si] 
        inc si
    jmp back_to_looping
    
    odd:
        add dh,arr[si] 
        inc si
    jmp back_to_looping

    break:
   
endp main
end main   