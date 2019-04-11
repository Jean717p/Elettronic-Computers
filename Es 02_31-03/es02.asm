.model small
.stack
.data
      
num dw 1256      
      
.code
.startup
mov cx,10
mov dx,0
mov ax,num
mov bx,0
conv: div cx
add dx,'0'
push dx
mov dx,0
inc bx
cmp ax,0
jnz conv
mov ah,02h
stampa: pop dx
int 21h
dec bx
jnz stampa   
     
     
.exit
end
