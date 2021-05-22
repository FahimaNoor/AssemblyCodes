include 'emu8086.inc'

.model small    
.stack 100H
.data
string db 50 dup('$')
len equ $-string
linefeed db 13, 10, "$"  
.code 

uppercase macro
        cmp [si], 5AH 
        jg Lower_To_Upper
        
        call display 
        jmp convert_to_uppercase 
endm uppercase

lowercase macro
        cmp [si], 20h  ;space
        je x3:
        
        cmp [si], 5BH 
        jl Upper_To_Lower
        
        x3:
        call display
        jmp convert_to_lowercase    
endm lowercase 

     
main proc   
        mov ax, @data 
        mov ds, ax  
        lea si,string
        mov dx, len
        call get_string
        call nextline

        convert_to_uppercase:
            cmp [si],'$'
            je x2:        
            uppercase      
        jmp convert_to_uppercase 
        
        x2:
        lea si,string
        call nextline
        convert_to_lowercase:
            cmp [si],'$'
            je break         
            lowercase
        jmp convert_to_lowercase 
  
    Upper_To_Lower:
        add [si], 20h  
        call display
    jmp convert_to_lowercase 
     
    Lower_To_Upper: 
        sub [si],20h 
        call display 
    jmp convert_to_uppercase 
    
  display proc   
    mov dx, [si] 
    mov ah,02h
    int 21h    
    inc si
    ret
  endp display
  
  nextline proc 
        mov ah, 09               ;to go to new line
        mov dx, offset linefeed
        int 21h
        ret
  endp nextline
          
    break:
    hlt  
     
define_get_string

endp main
end main   