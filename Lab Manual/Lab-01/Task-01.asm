
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100H 
 mov ah,3
 mov ax,2  ;02 is stored in ax, 0002h so ah-00 , al-02
 mov bx,2  ;02 is stored in bx
 add ax,bx ;the result is stored in al
 mov cx,ax
ret





