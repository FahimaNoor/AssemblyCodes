.model small    ; models can be of six types(tiny/small/medium/compact/large/huge)
.stack 100H
.data  ;contains all the data types like: variable, string, array.
;write anything related to variable, string, array here

.code  ;contains codes    
;write anything related to code here
     
main proc   
    mov ax, @data  ; in this model, code and data segments are written separately
    mov ds, ax   ;@data brings the two together
    
    
    ivar db 5 ; initialized variable ivar=5
    uVar db ? ; uninitialized variable uvar=5 
    iArr db 1,2,3,4,5 ; initialized array iArr of size 5
    uArr db ?,?,?,?,? ; uninitialized array uArr of size 5 
    uArr2 db 5 dup(?) ; ; initialized array uArr2 of size 5 with 5 ? as elements
    uArr3 db 2 dup(1,2) ;1,2 this will be carried out 2 times     
    str db 'abcd'; create string str=abcd
    constant k equ 5; k=5  check video?? 
    
    ;how to find Array length?
    
    len_Arr db 1,2,3,4,5
    len equ $-len_Arr ;this has to be written immediately after
                      ; the array declaration
    inc al  ; al++
    dec al  ; al--
    
    lea si, arr; first memory address of arr is going to be stored in si
               ; si is pointing to the first address of si
    inc si
    [si]
    si  ;gives you value of particular     
    
    
    ;for multiplication
    first_value->al/ax
    second_value->any register
    result->ax ; if the multiplication is of 8 bits  
    result->dx 
    ; if the multiplication is of 16 bits
      first_value->aX
      second value->bx
      result(lower_half)->ax  
      result(higher_half)->dx
      
      Division(al/bl) 
      first_value-> al/ax
      second_value->any registers
        
      8 bit division(ax/bl) ;bl is the register you want to perform division with: div bl. You can use cl instead of bl: mov cl,2   div cl
      dividend-> ax  divisor->bl
      
      ;after operation
      quotient-> al  remainder->ah
       
      
      Example:
      mov ah, 0
      mov al, 05h ; 
      mov bl, 06h  ax/b
      div bl
      
      to divide 8 bit ax/bl
      to divide 16 bit dx:ax/bl        
              
      16 bit division(ax/bx)
      quotient-> ax  remainder->dx 
      
      Example
      mov dx,0
      mov ax,03FFH ; dx(lower 8 bits) ; ax(higher 16 bit)
      mov bx,06h   ; dx=0,ax=03FFF
      div bx       ; 0000 3FFF
        
      
      
      add al,ah ; al=al+ah
      sub al,ah ; al=al-ah
      cmp al,ah ; al-ah    ;needed most when you write conditional statement  
      
      Difference between sub and cmp
        in sub, it subtracts and stores the value in the first parameter
        in cmp, it only subtracts but does not store.
        
     C: if(al==ah)  ; al-ah=0
      
      
      Jump many types, we will only use three types for the lab
      jump two types:
      conditional         unconditional
      
      
      jl al<ah
      jle al<=ah
      jg al>ah
      jz   ;checks if the value of the zero flag is 1, then it will perform a jump   
      
      The ones that will be most used are:
      cmp
      je labe1
      jne label 2
      
      
      
       
    
    
    
    
    
endp main
end main   


