PORTA equ 80h
PORTB equ PORTA+1
PORTC equ PORTA+2
CONTROL equ PORTA+3

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
MOV AL, 10001001b
OUT DX,AL
MOV DX,PORTA
MOV AL,char1
OUT DX,AL
MOV DX,PORTB
MOV AL,char2
OUT DX,AL
MOV DX,PORTC
IN AL,DX ;valore da impostare prima di eseguire questa istruzione
MOV lettura,AL

.exit
end
