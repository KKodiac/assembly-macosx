global start
    section .text   ;read-only section

start:
    mov rdx, output ;쓰기 작업을 할 주소값은 rdx에 저장된 값
    mov r8, '5'     ;첫번째 값 5
    sub r8, '0'
    mov r9, '1'     ;두번째 값 1
    sub r9, '0'
    add r9, r8      ;r9 += r8
    add r9, '0'
    mov [rdx], r9   ;output(rdx)에 값 쓰기 rdx 주소참조

done:
    mov rax, 0x02000004 ;write system call
    mov rdi, 1          ;file handle 1: stdout
    mov rsi, output     ;문자열 output의 주소
    mov rdx, 1          ;바이트의 갯수(출력 크기)
    syscall             ;write system call 실행

    mov rax, 0x02000001 ;exit system call
    xor rdi, rdi        ;exit code: 0 (xor 1 1 = 0)
    syscall             ;exit system call 실행


    section .bss

output:
    resq    1           ;출력으로 8바이트를 할당함
