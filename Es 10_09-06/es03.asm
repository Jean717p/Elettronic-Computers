PORTA equ 80h
PORTB equ PORTA+1
PORTC equ PORTA+2
CONTROL equ PORTA+3
PIC equ 40h ;interrupt controller
DIM equ 200
#start=8259.exe#

.model small
.stack
.data

INTERO dd 36 

.code
; procedura di configurazione della porta parallela
INIT_8255 PROC
    PUSH AX
    PUSH DX
    MOV DX, CONTROL
    ; inizializzazione 8255
    MOV AL, 10100000b ; Gruppo A: modo 1, input
    OUT DX, AL
    ; abilitazione interrupt PA input (INTE A)
    MOV AL,00001101b
    OUT DX,AL
    POP DX
    POP AX
    RET
INIT_8255 ENDP

; procedura di inizializzazione della interrupt vectortable
INIT_IVT PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DS
    XOR AX, AX
    MOV DS, AX
    MOV BX, 00100111b; channel 7 (39)
    MOV CL, 2
    SHL BX, CL
    MOV AX, offset ISR_PA_IN
    MOV DS:[BX], AX
    MOV AX, segISR_PA_IN
    MOV DS:[BX+2], AX
    POP DS
    POP CX
    POP BX
    POP AX
    RET
INIT_IVT ENDP

; procedura di configurazione dell'interrupt controller
INIT_8259 PROC
PUSH DX
PUSH AX
MOV DX, PIC
MOV AL, 00011011b ; ICW1
; LTIM = 1 (fronti), SNGL = 1, IC4 = 1
OUT DX, AL
MOV DX, PIC+1
MOV AL, 00100000b ; ICW2
; 5 bit alti del vettore interrupt = 00100
OUT DX, AL
MOV AL, 00000011b ; ICW4
; SFNM = 0, BUF = 0, M/S = 0 (no buffer mode)
; AEOI = 1, uPM= 1 (8086)
OUT DX, AL
MOV DX, PIC+1
MOV AL, 10111111b ; OCW1 RICORDA DI CAMBIARLA SOLO PER CHANNEL 7
; abilitazione canale 6
OUT DX, AL
POP DX
POP AX
RET
INIT_8259 ENDP 

ISR_PA_OUT PROC
PUSH AX
PUSH DX
PUSH SI
CMP BX, 0
JE ritorno
DEC BX
MOV DX, PORTA
MOV AL, byte ptr INTERO[BX]
OUT DX, AL
ritorno: 
POP SI
POP DX
POP AX
IRET
ISR_PA_OUT ENDP

.startup

CLI
call INIT_IVT
call INIT_8259
call INIT_8255
STI
MOV BX, 4 ; BX come contatore dei byte
INT 38 ; stampa del primo byte
block: jmpblock; ciclo infinito
.exit
end