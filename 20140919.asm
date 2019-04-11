PORTA equ 80h
PORTB equ PORTA+1
PORTC equ PORTA+2
CONTROL equ PORTA+3
;PORTAC bit6-->clock 
;bit7-->dato  
setbit6 equ 00001101b
setbit7 equ 00001111b
resetbit6 equ 00001100b
resetbit7 equ 00001110b

#start=8255.exe#
.model small
.stack
.data

char1 db 'O'
char2 db 'K'
lettura db ?

.code
.startup

MOV DX,CONTROL
MOV AL, 10000000b ;modo 0 tutto in output
OUT DX,AL
mov al,'c'
xor ah,ah
push ax
call sendcode
add sp,2

.exit

PROC sendcode
    
    mov bp,sp
    push ax
    push bx
    push cx
    push dx
    mov bx,[bp+2]
    mov dx,CONTROL
    mov al,setbit7 ;dato
    out dx,al ;start bit
    mov al,setbit6 ;clock
    out dx,al ;clock
    mov al,resetbit6
    out dx,al
    
    mov cx,8
    ciclo:
        shl bl,1
        jnc zero
        inc bh
        mov al,setbit7
        jmp skip
        zero: 
        mov al,resetbit7
        skip:
        out dx,al ;dato
        mov al,setbit6        
        out dx,al ;clock
        mov al,resetbit6
        out dx,al
        loop ciclo
        
    shr bh,1 ;numero di 1 nel byte
    jnc pari ;se pari-->dispairbit=1 altrimenti 0
    mov al,resetbit7
    jmp fin
    pari:
    mov al,setbit7
    fin:
    out dx,al
    mov al,setbit6
    out dx,al
    mov al,resetbit6
    out dx,al
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
    ENDP
end
