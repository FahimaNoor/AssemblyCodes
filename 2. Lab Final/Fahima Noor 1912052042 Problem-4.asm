include 'emu8086.inc'
.model small    
.stack 100H
.data     
string db 50 dup('$') 
len = $-string 

a db ?
e db ?
i db ?
o db ?
u db ?

.code 

increment macro vowel 
    add vowel,1
    jmp x1
endm increment
     
main proc   
    mov ax, @data 
    mov ds, ax  
    lea si,string  
    mov dx,len 
    mov cl,0    
    call get_string  ;get string from user  
    
    count: 
        cmp [si],'$'
        je break  
        cmp [si], 41h  ;A
        je increment_a
        cmp [si], 61h  ;a
        je increment_a 
        
        cmp [si],45h   ;E
        je increment_e    
        cmp [si],65h   ;e
        je increment_e
        
        cmp [si],49h   ;I
        je increment_i
        cmp [si],69h   ;i
        je increment_i
        
        cmp [si],4Fh   ;O
        je increment_o    
        cmp [si],6Fh   ;o
        je increment_o
        
        cmp [si],55h  ;U
        je increment_u    
        cmp [si],75h  ;u
        je increment_u
        
        x1: 
        inc si
    jmp count 
   
increment_a: increment a
increment_e: increment e
increment_i: increment i
increment_o: increment o
increment_u: increment u 

break:
hlt    
    
define_get_string   
endp main
end main   