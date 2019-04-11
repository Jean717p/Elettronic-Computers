dim equ 5
cent equ 100
.model small
.stack
.data

vett1 dw 39, 1880, 2394, 1000, 1590
vett2 dw dim dup(?)
sconto dw 30
totsconto dw 0

.code
.startup

lea si,vett1
lea di,vett2
mov cx,cent
sub cx,sconto
mov dx,dim
push dx
push si
push di
push cx
call calcola
pop cx
pop di
pop si    

.exit

calcola PROC
    mov bp,sp
    push ax
    push bx
    push dx
    mov cx,[bp+8]
    ciclo:
        mov ax,[si]
        mov bx,[bp+2]
        mul bx
        mov bx,cent
        div bx
        cmp dx,50
        jl skip
        inc ax
   skip:mov [di],ax
        add si,2
        add di,2
        loop ciclo
    mov si,[bp+6]
    mov di,[bp+4]
    mov cx,[bp+8]
    cil:
        mov ax,[si]
        mov bx,[di]
        sub ax,bx
        add totsconto,ax
        add si,2
        add di,2
        loop cil
    pop dx
    pop bx
    pop ax
    ret
    calcola ENDP

end