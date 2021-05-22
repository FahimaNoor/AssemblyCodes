.model small    
.stack 100H
.data
 
avg db 0 
sum db 0
lowest db 9
highest db ? 

linefeed db 13, 10, "$" 
.code   
main proc   
    mov ax, @data 
    mov ds, ax 
    mov ax,0
    mov cx,31
    
    input:
    cmp cx,0
    je average
    
    mov ah, 01h
    int 21h  
    
    cmp al, 20h
    je space
    
    sub al,30H ;convert from ascii value to real value
    add sum,al 
   
    x1:
    cmp lowest, al
    jg minimum 
   
    x2:
    cmp highest, al
    jl maximum
    dec cx
   
    jmp input
         
space:
jmp input   

minimum:
mov lowest,al 
jmp x1 

maximum:
mov highest,al 
jmp x1 
      
average:
mov dl, sum  
shr dl, 4 ; divide by 16  
mov avg,dl  


display:

call new_line 

add avg,30h         ;first displays the average
mov dl, avg 
mov ah, 02h
int 21h   

call new_line

add lowest,30h           ;second displays the lowest value
mov ah, 02h
mov dl, lowest
int 21h

call new_line

add highest,30h 
mov ah, 02h
mov dl, highest        ;third displays the highest value
int 21h

break:
hlt   
 
new_line proc   
mov ah, 09               ;to go to new line
mov dx, offset linefeed
int 21h 
ret        
endp new_line 

endp main
end main   