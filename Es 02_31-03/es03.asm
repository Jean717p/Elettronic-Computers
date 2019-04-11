dim equ 5
cr equ 13
.model small
.stack
.data

res dw dim dup (?)
fattore dw 10
message db 'Introdurre 5 interi positivi separati da ENTER:   '
errore1 db 'ERRORE: Caratteri non numerici introdotti!!!!!'
errore2 db 'ERRORE: Intero introdotto troppo grande!!!!!!!'

.code
.startup 

mov ah,02h
lea si,message
mov cx,50 ;lunghezza messaggio 

stampa: mov dl,[si]
int 21h
inc si
loop stampa

lea di,res
mov cx,dim ;dimensione loop!!
ciclo: mov ax,0
mov [di],ax  

read: mov ah,01h ;legge
int 21h
cmp al,cr
jz succ
cmp al,'0'
jl er1
cmp al,'9'
jg er1
sub al,'0'
mov ah,0  
mov bx,ax
mov ax,[di]
mul fattore
add ax,bx
jc er2
mov [di],ax
jmp read  

succ: add di,2
loop ciclo
jmp fine

 

er1: mov ah,02h
lea si,errore1
mov cx,50

stampa1: mov dl,[si]
int 21h
inc si
loop stampa1
jmp fine  



er2: mov ah,02h
lea si,errore2
mov cx,50

stampa2: mov dl,[si]
int 21h
inc si
loop stampa2
jmp fine


fine:

.exit
end