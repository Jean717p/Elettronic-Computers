dim equ 2
.model small
.stack
.data

riferimento dd 82C0B685h
address dd 82C028D1h,81C0276Ah
mask dd FFFC0000h
ris dd dim dup(?)

.code
.startup
lea bx,ris
mov ax,word ptr riferimento
push ax
mov ax,word ptr riferimento+2
push ax
mov ax,word ptr mask
push ax
mov ax,word ptr mask+2
push ax
mov cx,dim
ciclo:
    lea ax,address
    push ax
    call filtro
    add ris,32
    loop ciclo
mov ris,bx
.exit

filtro PROC
    mov bp,sp
    push si
    push cx
    push bx
    push ax
    push dx
    xor dx,dx
    lea si,[bp+2] ;address
get:mov ax,[bp+4+dx] ;mask
    mov bx,[bp+8+dx] ;riferimento
    mov cx,16 
cil:shl ax,1
    jnc skip1
    shl [si],1
    jnc skip2
    shl bx,1
    jnc skip
    add ris,1
    jmp skip
skip1:shl [si],1
skip2:shl bx,1
skip:shl ris,1
    loop cil
    cmp dx,2
    je ex
    add dx,2
    jmp get
ex: pop dx
    pop ax
    pop bx
    pop cx
    pop si
    mov bp,sp      
    ret
    filtro ENDP
end