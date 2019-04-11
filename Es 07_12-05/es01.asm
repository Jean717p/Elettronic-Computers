.model small
.stack
.data

n db 6
k db 3
ris dw ?
.code
.startup

call combina
        

.exit

combina PROC
    push cx
    push ax
    push bx
    xor cx,cx
    mov cl,k
    dec cl
    xor ax,ax
    mov al,n
    mov bl,n
    dec bl
    ciclo:
        mul bl
        dec bl
        loop ciclo
    xor ah,ah
    push ax
    mov al,k
    mov bl,k
    dec bl
    mov cl,k
    dec cx
    cil:
        mul bl
        dec bl
        loop cil
    mov bl,al
    pop ax
    div bl
    cbw
    mov ris,ax
    pop bx
    pop ax
    pop cx
    combina ENDP

end