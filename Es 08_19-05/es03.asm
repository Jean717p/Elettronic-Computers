.model small
.stack
.data

stringa db "notte rossa"
lung dw 11
lung2 dw ?

.code
.startup

lea ax,stringa
push ax
mov ax,lung
push ax
sub sp,2
call convert
pop ax
mov lung2,ax
pop ax
pop ax
.exit

convert PROC
    mov bp,sp
    push si
    push cx
    push di
    push ax
    push bx
    push dx
    xor bx,bx
    mov cx,[bp+4]
    mov si,[bp+6]
    mov di,si
    inc di
    dec cx
    ciclo:
        mov al,[di]
        mov ah,[si]
        cmp al,ah
        jne skip
        inc di
        inc si
        mov bh,[di]
        mov [si],bh
        inc bl
        dec cx
        mov dx,cx
        dec dx
        push si
        push di
    cil:inc si
        inc di
        mov bh,[di]
        mov [si],bh
        dec dx
        cmp dx,0
        jne cil
        mov [di],bl
        pop di
        pop si
   skip:inc si
        inc di
        loop ciclo
    xor bh,bh
    mov ax,[bp+4]
    sub ax,bx    
    mov [bp+2],ax
    pop dx
    pop bx
    pop ax
    pop di
    pop cx
    pop si    
    ret    
    convert ENDP
end
