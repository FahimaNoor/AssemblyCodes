include 'emu8086.inc'
.model small    
.stack 100H
.data 
linefeed db 13, 10, "$" 

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax   


   
   
   

nextline proc    ;to use this function:   call nextline
        mov ah, 09               ;to go to new line and starts the cursor from beginning
        mov dx, offset linefeed
        int 21h
        ret
endp nextline

define_get_string ;to use this function that is to take string input from user use this: call get_string

endp main
end main   


