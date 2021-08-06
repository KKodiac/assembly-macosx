    global    start
    section   .text             ;read-only section
start:
    mov       rax, 0x02000004   ;write system call
    mov       rdi, 1            ;file handle set to 1 : stdout
    mov       rsi, message      ;rsi을 message 주소값으로 정의
    mov       rdx, 13           ;13바이트로 쓰기 크기 정의
    syscall                     ;쓰기 실행
    mov       rax, 0x02000001   ;exit system call
    xor       rdi, rdi          ;exit handle 0
    syscall                     ;exit 실행

    section   .data             ;runtime에 바뀌지 않는 상수 값을 초기에 정의해주기 위한 섹션
message: 
    db "Hello, World", 0x10       ;db stands for 'data byte'
                                ;writes to address `message` "Hello, World", 
                                ;and a white space(0x10) after it
