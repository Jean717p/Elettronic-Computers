dim equ 5
.model small
.stack
.data

matr dw 1,0,0,0,0,
     dw 0,2,0,0,0,
     dw 0,0,3,0,0,
     dw 0,0,0,4,0,
     dw 0,0,0,0,5

.code
.startup

mov ax,0
mov bx,0
mov cx,(dim*dim-1)*2
ciclo:
     cmp bx,ax
     jnz ndiag
     add ax,(dim+1)*2
     jmp skip 
     ndiag:
        cmp matr[bx],0
        jnz simm        
     skip:
     add bx,2
     loop ciclo
mov dl,2
cmp cx,0
jz stampa

mov si,OFFSET matr
mov di,OFFSET matr
add di,2
mov cx,dim
mov dx,0
mov ax,4 
simm:
    mov dl,dim-1 
    mov dh,0
    nndiag:
        cmp [di],[si]+dh
        jnz sskip
        add dh,dim*2
        add di,2
        dec dl
        cmp dl,0
        jnz nndiag
    add di,ax
    add ax,2
    loop simm
sskip:
mov dl,1
cmp cx,0
jz stampa
mov dl,0

stampa:
    mov ah,2
    int 21h        


.exit
end