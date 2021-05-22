.model small    
.stack 100H
.data 

.code 

string1 db 'Hello World, '  
len1 equ $-string1
string2 db 'this is Assembly Language Programming'
len2 equ $-string2     
string3 db 52 dup(?)
  
main proc   
    mov ax, @data 
    mov ds, ax  
    mov ch,0
    mov cl,0
    lea si,string1 
    lea di,string3
    lea bx,string2 
    
    
    first_string: 
    cmp ch,len1
    je second_string 
    mov al,[si] 
    mov [di],al
    
    inc di
    inc si
    inc ch
    jmp first_string  
    
    
    second_string: 
    cmp cl,len2
    je end_string 
    mov al,[bx] 
    mov [di],al 
    inc di
    inc bx
    inc cl
    jmp second_string 
    
    
    end_string: 
    mov [di],'$'
    hlt
       
endp main
end main   


