.model small
.stack
.data

opa dw 2043
opb dw 5
res dw ?

.code
.startup

mov dx,0
mov ax,opa
mov res,ax
mov ah,1
int 21h
sub al,'0'
cmp al,1
jnz less 
mov ax,opb
add res,ax
jmp ex
less:
    cmp al,2
    jnz mult 
    mov ax,opb
    sub res,ax
    jmp ex
mult:
    cmp al,3
    jnz divi
    mov ax,opb
    mul res
    mov res,ax
    jmp ex
divi:
    cmp al,4
    jnz ex 
    mov ax,res
    div opb
    mov res,ax
    jmp ex
    
;messaggio d'errore


ex:
.exit
end