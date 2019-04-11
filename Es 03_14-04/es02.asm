dim equ 16
rc equ 4

.model small
.stack
.data

vett1 dw 2,4,6,8
vett2 dw 1,3,5,7
matr dd dim dup (?) 

.code
.startup
 
mov si,OFFSET matr
mov bx,-2
lab:
    mov cx,rc
    mov di,OFFSET vett2
    add bx,2
    mal: 
        mov dx,0   
        mov ax,vett1[bx]
        mul [di]
        mov word ptr [si]+2,dx
        mov word ptr [si],ax
        add di,2
        add si,2
        loop mal   
    cmp bx,rc*2-2
    jnz lab

.exit
end