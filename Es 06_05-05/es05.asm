dim equ 4
.model small
.stack
.data

vett1 dw 1,5,7,15
vett2 dw 4,10,14,60
ris dw dim dup(?)

.code
.startup

lea bx,ris
lea si,vett1
lea di,vett2 
mov cx,dim
ciclo:
    mov ax,[si]
    push ax
    mov ax,[di]
    push ax
    call media
    pop ax
    pop dx
    mov [bx],ax
    add bx,2
    add di,2
    add si,2
    loop ciclo

.exit 

media PROC
    mov bp,sp
    push ax
    mov ax,[bp+2]
    add ax,[bp+4]
    sar ax,1
    mov [bp+2],ax
    pop ax
    RET
media ENDP

end