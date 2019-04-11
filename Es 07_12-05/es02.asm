.model small
.stack
.data

stringa1 db "Inserire un numero intero: "
lung1 dw 26
stringa2 db "E' dispari"
lung2 dw 10
stringa3 db "E' pari"
lung3 dw 7

.code
.startup    

mov cx,lung1
mov si,OFFSET stringa1
call stampa
mov ah,1
int 21h
sub al,'0'
cmp al,9
jg fin
cmp al,0
jl fin
shr al,1
jnc pari
mov cx,lung2
mov si,OFFSET stringa2
call stampa
jmp fin
pari:
    mov cx,lung3
    mov si,OFFSET stringa3
fin:     

.exit

stampa PROC
    mov ah,2
    ciclo:
        mov dl,[si]
        int 21h
        inc si
        loop ciclo  
        ret
    stampa ENDP
    

end