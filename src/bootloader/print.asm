print:
        mov ah, 0x0e
        mov al, [bx]
        int 0x10
        inc bx
        cmp al, 0
        jne print
        ret