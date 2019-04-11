PORTA equ 80h
PORTB equ PORTA+1
PORTC equ PORTA+2
CONTROL equ PORTA+3

#start=8255.exe#
.model small
.stack
.data

start db 255

.code
.startup

MOV DX,CONTROL
MOV AL, 10001001b
OUT DX,AL
MOV AL,start
ciclo:
    MOV DX,PORTA
    OUT DX,AL
    DEC AL
    MOV DX,PORTB
    OUT DX,AL
    CMP AL,0
    JE esci
    DEC AL
    JMP ciclo
esci:
.exit
end