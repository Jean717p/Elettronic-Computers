.model small
.stack
.data
opa dw -459
opb dw 470
opc dw -32756
opd dw 1
.code
.startup 

mov ax,opa
add ax,opb
sub ax,opc
add ax,opd  ;c'e overflow perche sono con segno
mov opa,ax


.exit
end