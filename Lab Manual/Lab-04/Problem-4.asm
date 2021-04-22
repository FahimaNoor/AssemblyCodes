.model small    
.stack 100H
.data 

string_1 db 15 dup(?) 
string_2 db 15 dup(?) 
output_string db 'They are the same','$' 


.code

print macro string_parameter
     lea di, string_parameter           
     mov dl,10              ;let's go to new line starting from column 1 
     mov ah,2               ;IF AH=2 AND THE INT21H IS CALLED, THE PROGRAM WILL GIVE THE DISPLAY INTERRUPT in Console, cursor will move to next like column1
     int 21h
                            ;had to preprocess few stuffs before we could display
    jmp display             
endm print 

     
main proc   
    mov ax, @data 
    mov ds, ax   
    lea si, string_1 ;let's start the procressing with string_1    
    mov ch,0
    
    string_input:    ;takes the user input and puts each character in each index of the string_1 with the help of si pointing to it
        
            mov ah,1
            int 21h      ;the user input hex converted data will be stored in al reigster. user gives 'd' and after the execution of this line the al register will have the value 64h which is the hex value of 'd'
            cmp al,13    ;al=carriage return  ;compares if the value inside al is 'enter' or not. If it's enter that would mean that the word has ended.
            je processing   ;user input has ended so we got to go to the display part where we will start to display
            mov [si],al  ; move the user input charater data as data value into the address the si is pointing to
            inc si       ; incrementing the si so that it points to the next index
    
    jmp string_input

    processing:               ; few things to process before we can start processing new string
       mov [si],'$'
       mov dl,10              ;let's go to new line      ;QUESTION  WHY IS 13 BEHAVING AS NEWLINE INSTEAD OF JUST THE NUMBER 13??
       mov ah,2               ;IF AH=2 AND THE INT21H IS CALLET, THE PROGRAM WILL GIVE THE DISPLAY INTERRUPT
       int 21h 
       cmp ch,0
       je second_string       ;necessary processing done let's jump to second sting were we would set di to point towards string_2 input so we can take the input for second string ;i am using ch so that I can only call this line once. For the program I need to call this line once as after that I do not need to take any user input.
       jne compare
       
    second_string: 
        lea si, string_2   ;setting the di pointer to point towards the array of string_2
        inc ch
    jmp string_input       ;let's jump back to take more 
    
    compare: 
     
    ;cmp [di], '$' 
        
    lea si,string_1
    lea di,string_2 
   
    looping:
     cmp [si],'$'
     je same_strings  ; string either same or not same 
     mov al,[si]     
     cmp al,[di]     ;comparing
     jg lex_string_1 ;jump to the label which will pass the string_1 to print macro
     jl lex_string_2 ;jump to the label which will pass the string_2 to print macro
    
    inc si
    inc di
    jmp looping
                                
   lex_string_1:  
   print string_1
   
   lex_string_2:  
   print string_2  
   
   display:
        cmp [di],'$'   ;loops till it finds the end of the string which means both strings are same(same string means same length)
        je break       ;if it finds the end then it will go to the last
        
        mov dl,[di]   ;if not then put the value stored inside di to be inside dl
        mov ah,2      ;display function will be 
        int 21h       ;as ah=2, then the display interrupt will occur where the data inside dl will be displayed
        inc di        ;increment di so we can process the data in the next index of the array msg
    jmp display            
    
    same_strings: 
    Lea dx,output_string
    Mov ah,09
    Int 21h 

break:
hlt   
endp main
end main    


;display string all at once
.model small    
.stack 100H
.data 
output_string db 'They are the same','$' 

.code 
main proc                
    same_strings: 
    Lea dx,output_string
    Mov ah,09
    Int 21h 
 
 endp main
end main
