dim equ 3
.model small
.stack
.data

matr dw 3,4,5
     dw 6,7,8
     dw 9,10,11
vett dw dim dup(?)
ris dw 0
.code
.startup
mov si,OFFSET matr
mov ax,[si+12]
mov vett,ax
mov ax,[si+14]
mov vett+2,ax
mov ax,[si+16]
mov vett+4,ax
xor dx,dx
mov cx,dim-1
ciclo:
    mov ax,[si]
    push ax
    mov ax,[si+8]
    push ax
    mov ax,[si+2]
    push ax
    mov ax,[si+6]
    push ax
    call det
    pop ax
    pop ax
    pop ax
    add si,2
    loop ciclo
sub si,4
mov ax,[si]
push ax
mov ax,[si+10]
push ax
mov ax,[si+4]
push ax
mov ax,[si+6]
push ax
call det
pop ax
pop ax
pop ax
mov bx,vett+2
pop ax
mul bx
mov cx,ax
mov bx,vett
pop ax
mul bx
add cx,ax
mov bx,vett+4
pop ax
mul bx
add cx,ax
mov ris,cx
.exit

det PROC
    mov bp,sp
    push ax
    push bx
    push dx
    push cx
    mov ax,[bp+8]
    mov bx,[bp+6]
    mul bx
    mov bx,[bp+4]
    mov cx,ax    ;
    mov ax,[bp+2]
    mul bx
    sub cx,ax
    mov [bp+8],cx
    pop cx
    pop dx
    pop bx
    pop ax
    RET
det ENDP

end