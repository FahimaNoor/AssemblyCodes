.model small    ; models can be of six types(tiny/small/medium/compact/large/huge)
.stack 100H
.data  ;contains all the data types like: variable, string, array.
;write anything related to variable, string, array here

.code  ;contains codes    
;write anything related to code here
     
main proc   
    mov ax, @data  ; in this model, code and data segments are written separately
    mov ds, ax   ;@data brings the two together
    ; write  
    
endp main
end main   


