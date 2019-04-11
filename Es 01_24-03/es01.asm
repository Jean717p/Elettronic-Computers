.model small
.stack
.data

var1 db 'a'
var2 db 'b'
var3 db 'm'

.code
.startup  
 
mov cl,var1
sub cl,'a'
add cl,'A'
mov var1,cl
mov cl,var2
sub cl,'a'
add cl,'A'
mov var2,cl
mov cl,var3
sub cl,'a'
add cl,'A'
mov var3,cl


mov ah,2 
mov dl,var1
int 21h    
mov dl,var2
int 21h
mov dl,var3
int 21h


.exit
end