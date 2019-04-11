dim equ 100
.model small
.stack
.data

tab dw dim dup (?)
vett db 0,1,2,3,4,5,6,7,8,9

.code
.startup

mov si,OFFSET tab
mov di,OFFSET vett
mov bx,0 
check:  
    mov cx,10
    inc bl
    exe:
        mov al,bl
        mul [di]
        mov [si],ax
        inc bh
        inc di
        add si,2
        loop exe
     mov di,OFFSET vett
     cmp bh,100
     jnz check

.exit
end