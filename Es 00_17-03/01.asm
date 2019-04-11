dim equ 20
.model small
.stack
.data
    
vett db dim dup(?)
   
.code
.startup

mov cx,dim
mov di,0
mov ah,1 
lab1: INT 21H ; lettura di un carattere
MOV VETT[DI], AL ; memorizzaz. del carattere letto
INC DI ; passa all'elemento successivo
DEC CX ; decrementa il contatore
CMP CX, 0 ; confronta il contatore con 0
JNZ lab1 ; se diverso da 0 salta
mov di,cx
MOV CX, DIM
MOV AH, 2 ; predisposizione del registro AH
lab2: DEC cx ; passa all'elemento precedente
MOV DL, VETT[DI]
INT 21H ; visualizzazione di un carattere
inc di ; decrementa il contatore
CMP CX, 0 ; confronta il contatore con 0
JNZ lab2 ; se diverso da 0 salta

.exit
end