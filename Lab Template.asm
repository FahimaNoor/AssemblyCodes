include 'emu8086.inc'
.model small    
.stack 100H
.data           
linefeed db 13, 10, "$" 

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax
  

 
 
   
   
  







hlt
nextline proc    
        mov ah, 09               
        mov dx, offset linefeed
        int 21h
        ret
endp nextline
define_print_num  ; print number stored in AX.
define_print_num_uns  ; required for print_num.   
define_print_string   ;
define_get_string 
endp main
end main 
    
  
  
  
         
         
         
         
         
         
  
  
  
  
    
    
    ;input string   
        string db 50 dup('$')
        len = $-string
    lea si,string
    mov dx,len
    call get_string 
    
    
    ;store in memory
    mov cx,0F000H  ;address
    mov ds,cx
    mov bx,0f000H
    mov word ptr ds:[bx], ax ;will store the value from ax in 0F000:0F000   


