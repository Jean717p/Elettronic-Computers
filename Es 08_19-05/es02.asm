lung equ 6
.model small
.stack
.data

vett1 dw 1945, 2008, 1800, 2006, 1748, 1600
vett2 db lung dup(?)

.code
.startup

mov bx,lung
lea si,vett1
lea di,vett2
call calcola

.exit

calcola PROC
    mov bp,sp
    push cx
    push ax
    push dx
    mov cx,bx
    ciclo:
        mov ax,[si]
        mov bl,100
        div bl
        cmp ah,0
        jne skip4
        xor ah,ah
        mov bl,4
        div bl
        cmp ah,0
        jne skip
        jmp ok
  skip4:mov ax,[si]
        sar ax,1
        jc skip
        sar ax,1
        jc skip
     ok:mov [di],1
   skip:add si,2
        inc di
        loop ciclo
    pop dx
    pop ax
    pop cx
    ret
    calcola ENDP


end