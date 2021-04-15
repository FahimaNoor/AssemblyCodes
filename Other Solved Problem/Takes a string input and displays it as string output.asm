.model small    
.stack 100H
.data 

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax 
   
        mov dx, offset buffer
		mov ah, 0ah
		int 21h
		jmp print
		buffer db 10,?, 10 dup(' ')
		print:
		xor bx, bx
		mov bl, buffer[1]
		mov buffer[bx+2], '$'
		mov dx, offset buffer + 2
		mov ah, 9
		int 21h  
   
endp main
end main   


