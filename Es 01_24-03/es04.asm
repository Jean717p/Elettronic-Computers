.model small
.stack
.data

opa dw 32767
opb dw 1

.code
.startup

mov ax,opa
add ax,opb ;va in overflow diventando -32768
add ax,opa ;diventa -1
add ax,opb ;diventa 0 (zf=1)
;quando va in overflow il numero diventa negativo!


.exit
end