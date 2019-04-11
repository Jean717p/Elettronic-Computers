dim equ 4
.model small
.stack
.data

string db "word"

.code
.startup

mov bx,dim
lea ax,string
call stampa

.exit

stampa PROC
    push ax
    push cx
    push di
    push dx
    mov di,ax
    mov ah,2
    mov cx,bx
ciclo:
    mov dl,[di]
    int 21h
    inc di
    loop ciclo
    pop dx
    pop di
    pop cx
    pop ax
    RET
stampa ENDP

end
    