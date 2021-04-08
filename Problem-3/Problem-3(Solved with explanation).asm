;things to do to solve the problem    
        ;take the declared array as it is
        ;carry out a loop till the length of array
        ;if the index of the array is even, keep the value stored inside the even index of the array into "even array"
        ;otherwise keep the value in odd index in "odd array"      
            
            
;things to keep in mind when coding in Assembly    
        ;the highest number of array you can use lea with is 3. The three registers that you can use as pointers for lea are si, di, bx
        
        ;you cannot create two labels in different locations with same name, i.e
            ;line 20  two:
            ;line 35  two: 
            ;the above example is invalid 
        
        ;you can jmp to same lable from different location
            ;line 20  jmp two
            ;line 35  jmp two 
            ;the above example is valid   
        ;division
        
        ;for 8 bit division
        ; mov al,2
        ; div cl  
        ; cl ) ax ( al
        ;     ----
        ;      ah  
        ;after division al and ah value will be updated
        
        ;the whole register ax will be taken as dividend when using the div instruction for the division of 8 bits. so must be careful to make sure to use " mov ah,0 " to remove garbage value 
        ; ax will be divided by register used in div instruction.
        ;Example
        ;div bl  ;whatever the value inside ax is it will be divided by the value stored inside bl. Then the remainder will be stored in ah register and the quotient will be stored inside al register.  
        
.model small    
.stack 100H
.data     ;the declaration of variables starts inside this data segment
array db 6,3,1,4,0,8,9,2,7,5   ;the initialised array is declared like given in the problem
len equ $-array  
even_array db 5 dup(?)  
odd_array db 5 dup(?)    

; the three lines below are not used in this problem because I have directly used two pointer registers. i is not used as I have used ch register in the code instead of i
;solve the same problem with these indexes instead if the pointer registers
i db 0  
even_index db 0       
odd_index  db 0 
;the same problem could be solved using the above three registers instead of si, di,bx registers

;the declaration of variables ends inside this data segment
.code    ;the coding of the problem starts       
main proc   
    mov ax, @data  
    mov ds, ax 
    lea si, array       ;loads the first adress of the array into the si register, that is the address of index=0 
    lea di, even_array  ;loads the first adress of the even_array into the di register, that is the address of index=0 
    lea bx, odd_array   ;loads the first adress of the odd_array into the bx register, that is the address of index=0 
    mov ch, 0 ;counter used for looping
  
    
  
    ; to carry out looping we will have to use jump instructions(loop instructions are not yet taught)
  
    
    ;jump instruction to carry out looping
     looping:  ;this is a label
       cmp ch, len    ; compares the ch with len
       je break       ; when ch becomes equal to length then it will leave the loop 
              
              ;start of carying out the division of condition    
               mov cl, 02h ; keep the value you want to divide a value with (cl will keep the value of Divisor). 
                         ;for this problem we want to carry out (i%2) to see if index is even or odd
               
               mov ah, 0   ; 8 bit division means result will be stored in ax(ah will store remainder al will store quotient).  
               
             ; mov al,[si] ; kept the value inside si in al. [si] means that it gives you the value kept inside the address si was pointing at;would have used this statement if we wanted to work with the value that is stored inside this index of the array 
                              
               mov al,ch   ; ch is the counter. This counter is basically used as index of the array. So we want to divide this with 2 that is stored in cl 
               
               div cl      ; whatever the value is stored inside this cl register, it will divide the whole ax register automatically  
              ;end of carying out the division of condition    
              
              cmp ah,0 ;ah contains the remainder value. so we are checking to see if the remainder is zero or not.
                       ;if ah is equal to zero, it means that 
              je  pushToEvenArray   ;if its equal then go to pushToEvenArray label           
              jne pushToOddArray    ;if its not equal then go to pushToEvenArray label
              
              to_looping:
              inc si ; points to the next address of array
              inc ch ; the ch which acts like a counter is incremented
              
      jmp looping   ; will jump back to the looping label
    
      pushToEvenArray:
      mov al,[si]   ;have to declare it again as al value has changed due to division
      mov [di],al   ;puts the address as value in di  
      inc di ; the di has to be incremented to move to the next address   
      jmp to_looping           
      
      pushToOddArray:
      mov al,[si]   ;have to declare it again as al value has changed due to division
      mov [bx],al   ;puts the address as value in di  
      inc bx ; the di has to be incremented to move to the next address  
      jmp to_looping
    
    
    
;start of unrelated code   
                            
            ;when we are doing 8 bit division, we have to work with ax, so to remove garbage value stored inside ah with mov ah,0
            ;bhag fol al ar bhag shesh(remainder) ah. we will shesh ah to see 
          
          
      ;  while(1){                    zero:   ; basic structure of loop
      ;    if(condition) break;         cmp al,ah (compare two register)
      ;                                 je break  ;
      ;  }                              jmp zero
          
;end of unrelated coded                 
                
      break:
endp main
end main   


