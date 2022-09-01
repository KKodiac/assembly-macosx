    global _main
    extern _puts

    section .text

_main:
    sub rsp, 8

    lea rdi, [message]
    call _puts
    add rsp, 8
    ret


    section .data
message:
default rel
    db "Hola, mundo", 0

