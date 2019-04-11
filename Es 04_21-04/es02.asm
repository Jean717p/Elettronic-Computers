dim equ 8
.model small
.stack
.data

valore dw 1,2,5,10,20,50,100,200
monete db 100,23,17,0,79,48,170,211
euro dw 0
cent dw 0
ord dw 100

.code
.startup

mov bx,0
mov dx,0
mov cx,dim
mov si,OFFSET valore
mov di,OFFSET monete
ciclo:
    mov ax,0 
    mov bx,[si]
    mov al,[di]    
    add si,2
    inc di
    mul bx
    cmp dx,0
    jnz ex
    div ord
    add euro,ax
    add cent,dx
    mov dx,0
    loop ciclo
mov ax,cent
div ord
mov cent,dx
add euro,ax   
    
ex:    


.exit
end