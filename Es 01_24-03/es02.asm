.model small
.stack
.data
n1 db 10
n2 db 10h
n3 db 10b
res db ?
.code
.startup

mov cl,n1
add cl,n2
sub cl,n3
mov res,cl

.exit
end