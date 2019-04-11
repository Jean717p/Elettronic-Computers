.model small
.stack
.data

a dw 3
b dw 4
c dw 7
var1 dw 0
var2 dw 0

.code
.startup 
mov di,0
mov cx,0
mov ax,a*(-4)
mul c 
mov bx,ax
cmp dx,0
jz asd
mov var1,dx

asd:
    mov ax,b
    mul b
    cmp dx,0
    jz else
    mov var2,dx
    
else:
    sub var1,var2
    js lab
    sub bx,ax
    js lab
    jmp output

output:
;scrivi risposta

lab:
;soluzione complessa

.exit
end