PORTA equ 80h
PORTB equ PORTA+1
PORTC equ PORTA+2
CONTROL equ PORTA+3

#start=8255.exe#
.model small
.stack
.data

ris DB ?

.code
.startup

MOV DX,CONTROL
MOV AL, 10010010b
OUT DX,AL
MOV DX,PORTA
IN AL,DX
MOV DX,PORTB
IN AH,DX
XOR AL,AH
NOT AL
MOV ris,AL
MOV DX,CONTROL
MOV CX,7
ciclo:
    MOV AL,CL
    SHL AL,1
    SHL AH,1
    ADC AL,0
    OUT DX,AL
    DEC CX
    JNS ciclo

.exit
end