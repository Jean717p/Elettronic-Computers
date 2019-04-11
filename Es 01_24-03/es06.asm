.model small
.stack
.data 
   
dim db 11
vett db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
risultato db ?  

.code
.startup

mov cl, dim
mov si, 0
ciclo:
add bl, vett[si]
inc si, 1
dec cl
cmp cl, 0
jnz ciclo
mov al, bl
div dim
mov risultato, al

.exit
end