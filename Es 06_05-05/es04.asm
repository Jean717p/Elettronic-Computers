dim equ 4
.model small
.stack
.data

vett1 dw 1,5,7,15
vett2 dw 4,10,14,60
ris dw dim dup(?)
med dw 0

.code
.startup

lea bx,ris
lea si,vett1
lea di,vett2 
mov cx,dim
ciclo:
    mov ax,[si]
    mov dx,[di]
    call media
    mov [bx],ax
    add bx,2
    add di,2
    add si,2
    loop ciclo

.exit 

media PROC
    add ax,dx
    sar ax,1
    RET
media ENDP

end