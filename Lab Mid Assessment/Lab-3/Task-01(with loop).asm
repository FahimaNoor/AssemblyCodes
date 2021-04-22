.model small    
.stack 100H

.data
string db 'Assembly Language','$' 
stringlength db 0

.code   
main proc   
    mov ax, @data 
    mov ds, ax     
    mov cx,50     
    mov ch,0
    lea si,string
                 
    len_count: 
        cmp [si],'$'
        je length_of_string 
        inc ch
        inc si
    loop len_count
        
    length_of_string:
        mov stringlength, ch
        hlt

endp main
end main   