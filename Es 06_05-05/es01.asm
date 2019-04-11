dim equ 4
.model small
.stack
.data 

string db "word"

.code
.startup

mov cx,dim
lea si,string
xor ax,ax
ciclo: 
    mov al,[si]
    call converti
    mov [si],al
    inc si
    loop ciclo

.exit

converti PROC
    sub al,'a'
    add al,'A'
    RET
converti ENDP

end