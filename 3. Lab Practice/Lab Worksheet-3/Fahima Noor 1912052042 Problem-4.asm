include 'emu8086.inc'
.model small    
.stack 100H
.data  

arr1 db 1,2,3,4,5,7 
len1 equ $-arr1

arr2 db 1,2,3,4,5 
len2 equ $-arr2  

sum db 10 dup(?) 


.code 

     
main proc   
    mov ax, @data 
    mov ds, ax 
      
    lea si, arr1 
    lea di, arr2
    lea bx, sum
    mov dh,1 ; length of sum array  
    mov cl,len1    
    cmp cl,len2
    jg exchange
        
    summation:
        cmp cl,0
        je print_sum 
        mov al,[si] 
        mov dl,[di]
        add al,dl
        mov [bx],al  
        inc si
        inc di
        inc bx 
        inc dh
        dec cl   
    jmp summation
    
    exchange:
        mov cl,len2  
        jmp summation
    
    print_sum:
        lea si,sum
        mov ah,0 
        x1:
            cmp dh,1
            je break
            mov al,[si]
            call print_num
            inc si
            dec dh
    jmp x1  
    break:
        hlt   
   
define_print_num
define_print_num_uns  ; required for print_num. 
endp main
end main   


