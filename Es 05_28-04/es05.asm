dim equ 5
.model small
.stack
.data

vett dw 8,17,21,35,29
ris db dim dup(?)

.code
.startup

mov cx,dim
mov bl,2
mov si,OFFSET vett
mov di,OFFSET ris 
cil:
    mov ax,[si]
    div bl
    cmp ah,0
    jz next
    cmp bl,2
    jnz skip
    mov bh,al
    skip:
        inc bl
        cmp bl,bh
        jnz cil
        inc [di]
    next:
        add si,2
        inc di
        mov bl,2
        loop cil   
.exit
end