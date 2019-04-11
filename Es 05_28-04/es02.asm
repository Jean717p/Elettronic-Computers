.model small
.stack
.data

opA db ?
opB db ?
ris db 0


.code
.startup
mov cx,8
mov ah,1
get:   
    int 21h
    sub al,'0'
    add opA,al
    cmp cx,1
    jz getst
    shl opA,1 
    dec cx
    jmp get
getst:
    mov ah,2
    mov dl,31
    int 21h
    mov ah,1
    mov cx,8
get2:
    int 21h
    sub al,'0'
    add opB,al
    cmp cx,1
    jz next
    shl opB,1
    dec cx
    jmp get2
next:
    mov al,opA
    mov ah,opB
    not ah
    and al,ah
    not al
    mov bl,opA
    not ah
    xor bl,ah
    or al,bl
mov ris,al   

.exit
end