.model small

.data
msg db 15 dup(?) ;you can change the msg length that you want to use

.code
main proc
    mov ax,@data
    mov ds,ax
   ; mov si,offset msg ; loads the adress of the array msg
    lea si,msg
    
input: 
    mov ah,1
    int 21h      ;the user input hex converted data will be stored in al reigster. user gives 'd' and after the execution of this line the al register will have the value 64h which is the hex value of 'd'
    cmp al,13    ;al=carriage return  ;compares if the value inside al is 'enter' or not. If it's enter that would mean that the word has ended.
    je display   ;user input has ended so we got to go to the display part where we will start to display
    mov [si],al  ; move the user input charater data as data value into the address the si is pointing to
    inc si       ; incrementing the si so that it points to the next index
jmp input
 
 
display: mov [si],'$'     ; now let's finish of the string by replacing 'enter' with '$'. this means that the msg has the last index as $
     mov di,offset msg    ; now use another pointer to point at the begining of the string
   ; mov dl,13
   ; mov ah,2
   ;int 21h
 
   mov dl,10              ;let's go to new line      ;QUESTION  WHY IS 13 BEHAVING AS NEWLINE INSTEAD OF JUST THE NUMBER 13??
   mov ah,2               ;IF AH=2 AND THE INT21H IS CALLET, THE PROGRAM WILL GIVE THE DISPLAY INTERRUPT
   int 21h                ;displays on the console whatever data that is present inside dl
 
 
again: 
        cmp [di],'$'  ;loops till it finds the end of the string
        je last       ;if it finds the end then it will go to the last
        cmp [di],32   ;if you find space then go to next, meaning now next word will be processed(32 represent space)
        je next       ;go to next if above comparison is true
        mov dl,[di]   ;if not then put the value stored inside di to be inside dl
        mov ah,2      ;display function will be 
        int 21h       ;as ah=2, then the display interrupt will occur where the data inside dl will be displayed
        inc di        ;increment di so we can process the data in the next index of the array msg
    jmp again


next:   ;prepares the console to move the cursor to next line 
    mov dl,13 ;carriage return 
    mov ah,2
    int 21h   ;display whatever is inside the dl register. 13 represents enter so the display would move to the next line
    mov dl,10 ;I still have not understood why but the lines from 49,50,51 is needed but if not written the output display will overwrite in the same line lol (10 represents newline interrrupt)
    mov ah,2
    int 21h
    inc di ;goes to next index
    jmp again


last: mov ah,4ch  ;will activate the program termination function 
      int 21h     ;this interupt terminates the program. I think this two works similarly like the break label. More like it works similar to hlt

main endp


end              



; How to move cursor to next line:
    mov dl,13 ;carriage return 
    mov ah,2  ;ah=2 will activate the display function
    int 21h   ; display whatever is inside the dl register onto the console. 13 represents enter so the display would move to the next line