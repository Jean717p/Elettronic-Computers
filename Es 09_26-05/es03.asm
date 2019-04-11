PORTA equ 80h
PORTB equ PORTA+1
PORTC equ PORTA+2
CONTROL equ PORTA+3

#start=8255.exe#
.model small
.stack
.data

.code
.startup

MOV DX,CONTROL
MOV AL, 10011001b
OUT DX,AL  
CHIAMA:
MOV DX,PORTA
call procedura
MOV DX,PORTC
ciclo:
     IN AL,DX
     SHR AL,1
     JC CHIAMA
     JMP ciclo
.exit 

PROC procedura
    IN AL,DX
    CMP AL,'a'
    JB skip
    CMP AL,'z'
    JA skip
    SUB AL,'a'
    ADD AL,'A'
    MOV DX,PORTB
    OUT DX,AL
    skip:
    ret
ENDP procedura

end