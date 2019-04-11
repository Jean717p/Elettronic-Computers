.model small
.stack
.data

risult dd ?

.code
.startup

push 3      ;base
push 12     ;esponente
sub sp,4
call potenza
pop ax
pop dx
add sp,4
mov risult,ax
mov risult+2,dx
.exit

potenza PROC
    mov bp,sp
    push ax
    push dx
    push bx
    push cx
    xor dx,dx
    mov ax,1    
    mov cx,[bp+6]
    dec cx      ;parte da 3^0
    cmp cx,0
    jl ex
    cmp cx,0
    je fin
    mov bx,[bp+8]
    mov ax,bx  
    ciclo:
        mul bx
        cmp dx,0
        je skip
        push ax
        mov ax,dx
        mul bx
        jo ex
        mov dx,ax
        pop ax
        dec cx
        cmp cx,0
        je fin
        jmp mul2
    skip:
        loop ciclo
    jmp fin
    mul2:
        push dx
        mul bx
        push ax
        push dx
        mov ax,[bp-10]
        mul bx
        jo ex
        pop dx
        add ax,dx
        jo ex
        xchg dx,ax
        pop ax
        add sp,2
        loop mul2
    jmp fin    
    ex:
        mov [bp+4],0FFFFh
        mov [bp+2],0FFFFh
        pop cx
        pop bx
        pop dx
        pop ax
        ret
    fin:
    mov [bp+2],dx
    mov [bp+4],ax        
    pop cx
    pop bx
    pop dx
    pop ax
    ret
    potenza ENDP
end