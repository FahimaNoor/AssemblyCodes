.model small    
.stack 100H
.data 
STRING DB 'There is a pair of adjacent set bit','$'
.code 

     
main proc   
    mov ax, @data 
    mov ds, ax  
    
MOV AL,5 ;input 1
MOV DL,AL
MOV BL,13 ;input 2
MOV BH,1B 
MOV CX,8

COMPARE: 
MOV DL,AL ;moving the original al value back to dl for comparison
OR DL,BH
CMP DL,BL
JE ADJACENT 
SHL BH,1
LOOP COMPARE  
JMP BREAK

ADJACENT:
    lea dx, STRING
    mov ah, 09h        ;display string function
    int 21h  
    
BREAK:
   HLT
   
endp main
end main   