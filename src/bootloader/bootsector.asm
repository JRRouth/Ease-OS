; A boot sector that enters 32 - bit protected mode.
[ org 0 x7c00 ]
    mov bp , 0 x9000 ; Set the stack.
    mov sp , bp
    mov bx , MSG_REAL_MODE
    call print_string
    call switch_to_pm ; Note that we never return from here.
    jmp $
%include " gdt.asm "
%include " switch_to_pm.asm "
[ bits 32]
; This is where we arrive after switching to and initialising protected mode.
BEGIN_PM :
jmp $ ; Hang.
; Bootsector padding
times 510 -( $ - $$ ) db 0
dw 0 xaa55