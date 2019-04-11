dim equ 4
.model small
.stack
.data

vett1 db 000b,01b,100b,01010b
vett2 db 01101b,110b,1010b,10b
ris db dim dup(?)

.code
.startup

mov cx,dim
mov si,OFFSET vett1
mov di,OFFSET vett2
mov bx,OFFSET ris
ciclo: 
    mov ah,[si]
    mov al,[di]
    and ah,al
    mov [bx],ah
    inc si
    inc di
    inc bx
    loop ciclo
mov cx,dim
mov bx,0
mov si,OFFSET ris
cil:
    mov al,[si]
    inc si
    shr al,1             
    jc skip            
    add bx,1     ;num elementi pari
    skip: loop cil
.exit
end