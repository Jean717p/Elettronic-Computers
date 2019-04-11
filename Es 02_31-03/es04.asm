.model small
.stack
.data

vett db -5,-45,-96,-128
risultato dd ?
addendo dd 69000

.code
.startup 

mov cx,4
lea si,vett
mov bx,0      

ciclo: mov al,[si]
inc si
cbw
add bx,ax
loop ciclo

mov ax,bx
cwd
add ax,word ptr addendo
adc dx,word ptr addendo+2

mov word ptr risultato,ax
mov word ptr risultato+2,dx

.exit
end
