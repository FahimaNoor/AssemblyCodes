.model small    
.stack 100H
.data 

.code 

     
main proc   
    mov ax, @data 
    mov ds, ax  
    MOV BX, 1000000000000000B
    MOV AX,08H    ;??USE MN AS THE QUESTION SAID GENERALIZED
    MOV CL, 1H    
    MOV DX,AX     ; AS AX WILL BE OVERWRITTEN DURING THE CALCULATION, ORIGINAL VALUE NEEDS TO BE STORED TO FIND OUT THE VALUE FOR EACH BIT 
     
    LOOPING: 
    CMP CL,15
    JG BREAK
    SAL AX,1    ;MULTIPLY BY 2
    AND BX,DX   ;VALUE OF BX IS DESTROYED. NEED TO RESTORE IT LATER
    JZ X1
    ADD AX,1   ;ADD THE BIT   
    X1:
    MOV BX, 1000000000000000B    ;RESET THE BX 
    INC CL
    SHR BX,CL  
    INC CL    
    JMP LOOPING 
    
    BREAK:
    HLT
   
endp main
end main   


