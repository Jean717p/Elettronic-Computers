rig equ 5  ;li ho invertiti
col equ 3
.model small
.stack
.data

tab dw 154,123,109,86,4,?,412,-23,-231,9,50,?,123,-24,12,55,-45,?,?,?,?,?,?,? 

.code
.startup

mov si,0
ciclo: 
    mov bx,0 
    mov ax,tab[si][bx]
    add bx,2
    mov cx,rig-1
    cil:   
        add ax,tab[si][bx]
        add bx,2
        loop cil
    mov tab[si][bx],ax
    add si,rig*2
    add si,2
    cmp si,36
    jnz ciclo

mov bx,-2
zz: 
    add bx,2   
    mov si,0
    mov ax,tab[si][bx]
    add si,rig*2+2
    mov cx,col-1
    cac: 
        add ax,tab[si][bx]
        add si,rig*2
        add si,2
        loop cac
    mov tab[si][bx],ax
    cmp bx,rig*2
    jnz zz
    
    

.exit
end