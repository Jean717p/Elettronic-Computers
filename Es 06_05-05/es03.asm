dim equ 4
.model small
.stack
.data

vett1 dw 1,5,7,15
vett2 dw 4,10,14,60
ris dw dim dup(?)
op1 dw 0
op2 dw 0
med dw 0

.code
.startup

lea bx,ris
lea si,vett1
lea di,vett2 
mov cx,dim
ciclo:
    mov ax,[si]
    mov op1,ax
    mov ax,[di]
    mov op2,ax
    call media
    mov ax,med
    mov [bx],ax
    add bx,2
    add di,2
    add si,2
    loop ciclo

.exit 

media PROC
    push ax
    mov ax,op1
    add ax,op2
    sar ax,1
    mov med,ax
    pop ax
    RET
media ENDP

end