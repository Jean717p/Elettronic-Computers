.model small
.stack
.data

var db 28
ris dw 0

.code
.startup

mov cx,8
mov ax,0
conta:
    shl var,1
    jnc cil
    inc ax
 cil:        
    loop conta
mov ris,ax


.exit
end