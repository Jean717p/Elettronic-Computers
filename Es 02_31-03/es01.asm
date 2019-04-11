dim equ 7
.model small
.stack
.data

vett1 dw 423,3191,23,11,-412,3,9

.code
.startup

mov di,OFFSET vett1
mov si,di
add si,dim*2
sub si,2
mov ax,dim
mov bl,2
div bl 
cc: mov bx,[di]
xchg bx,[si]
mov [di],bx
dec al
sub si,2
add di,2
cmp al,0
jnz cc 

.exit
end