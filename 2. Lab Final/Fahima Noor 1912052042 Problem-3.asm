include 'emu8086.inc'
.model small    
.stack 100H
.data 

string db 50 dup('$')
len = $-string
alphabets db ?
digits  db ?

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax
    
    
    lea si,string
    mov dx,len
    call get_string 
    mov al,0 ;counter for alphabet
    mov cl,0 ;counter for digit 
    
    count:
        cmp [si], '$'
        je break 
        cmp [si], 3AH
        jl digit
        jg alphabet
        x1:
        inc si
    jmp count   

alphabet: 
    cmp [si], 41h
    jl x1
    cmp [si], 7ah
    jg x1
    cmp [si], 5bh
    jg x2 
    x3:
        inc al 
jmp x1 

x2:
    cmp [si], 61h
    jl x1
jmp x3
 
 
digit:
    cmp [si], 30h
    jl x1   
    inc cl 
jmp x1


break: 
    mov alphabets,al
    mov digits,cl
    hlt
define_get_string       
endp main
end main   


