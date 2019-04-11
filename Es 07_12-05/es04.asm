dim equ 33
dim2 equ 26 
.model small
.stack
.data

stringa db "rosso di sera buongiorno si spera"
alf db dim2 dup(?)

.code
.startup     

mov cx,dim
lea si,stringa
mov bl,'a'
xor bh,bh
mov dh,dim2
lea di,alf
ciclo:
    mov al,[si]
    sub al,bl
    cmp al,bh
    jl skip
    cmp al,dh
    jg skip
    add di[al],1
skip:inc si
    loop ciclo
mov ah,1
xor al,al
cil:
    mov cl,di[al]
    cmp cl,bh   ;bh=0
    je skip1
    cal:
    mov dl,'*' ;42
    int 21h
    dec cl
    cmp cl,bh
    jne cal
    mov dl,26
    int 21h
skip1:
    inc al
    dec dh
    cmp dh,bh
    jne cil
    
.exit
end      

non so perchè non mi faccia fare add di[al],1
