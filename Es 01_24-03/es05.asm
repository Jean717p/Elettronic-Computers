.model small
.stack
.data

giorni db 1
ore db 1
minuti db 1
risultato dw ?

.startup
.code    
mov bh, 24
mov al, giorni
mul bh 
mov bh,0
mov bl,ore   
add ax, bx  
jo lab 
jc lab
mov bx, 60
mul bx
jo lab  
jc lab
mov risultato,ax
jno asd
lab: mov risultato, 0ffffh
asd: 
.exit
end

