.model small
.stack
.data

numero dw 36
ris dw ?

.code
.startup

mov ax,numero
mov dx,0
mov cx,0

ciclo: 
    inc cx
    add dx,2
    sub ax,dx
    jnc ciclo

mov ris,cx

.exit
end