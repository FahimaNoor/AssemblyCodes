;Create two arrays of size 5. Load one of the arrays with random numbers of your choice. The
;second arrays should be kept blank. Copy the contents of the first array into the second array in
;reverse order. You must not use loops to accomplish this task.

.model small    
.stack 100H
.data   

array_1 db       8,      9,    10,    11,    12
;adress:       0000h   0001h  0002h  0003h  0004h

array_2 db 5 dup(?)
;address:      0005h........................0009h
.code 

     
main proc   
    mov ax, @data 
    mov ds, ax 
    
    ; lea si,array_1  ;no need
    lea di,array_2                   ;the adress stored in di is 0005h
    
    mov si, 4      ;the adress stored in si will be of 0004h
    mov al,[si]
    mov [di],al
    dec si            ;the adress stored in si will be 0003h
    inc di                    ;the adress stored in di will be of 0006h
    
    mov al,[si]
    mov [di],al
    dec si            ;the adress stored in si will be of 0002h
    inc di                    ;the adress stored in di will be of 0007h
    
    mov al,[si]
    mov [di],al
    dec si            ;the adress stored in si will be of 0001h
    inc di                    ;the adress stored in di will be of 0008h
    
    mov al,[si]
    mov [di],al
    dec si            ;the adress stored in si will be of 0000h
    inc di                    ;the adress stored in di will be of 0009h
    
    mov al,[si]
    mov [di],al
   
    
      
   
endp main
end main   


