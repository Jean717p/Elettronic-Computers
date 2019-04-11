dim equ 20
.model small
.stack
.data

vett dw dim dup (?)    
     
.code
.startup

mov si,OFFSET vett
mov ax,0
mov [si],1
add si,2
mov bx,1
mov cx,dim
lab:
mov dx,bx
add bx,ax         
mov [si],bx
add si,2
mov ax,dx
loop lab


.exit
end