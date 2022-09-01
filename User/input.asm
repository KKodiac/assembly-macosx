SECTION .data
  prompt db "Enter name "
  text2 db "Hello, ",0xa,0

        SYSCALL_WRITE equ       1
        SYSCALL_EXIT  equ       60
        SYSCALL_READ  equ       0

SECTION .bss
  name resb 0xff

SECTION .text
  global start

start:
 call printText1
 call getInput
 call printText2
 call printName

  mov rax, 60
  mov rdi, 0
  syscall

printText1:
  mov rax, SYSCALL_WRITE
  mov rdi, 1
  mov rsi, prompt
  mov rdx, 11
  syscall
  ret

getInput:
  mov rax, SYSCALL_READ
  mov rdi, 0
  mov rsi, name
  mov rdx, 0xff
  syscall
  ret

printText2:
  mov rax, SYSCALL_WRITE
  mov rdi, 1
  mov rsi, text2
  mov rdx, 7
  syscall
  ret

printName:
  mov rax, SYSCALL_WRITE
  mov rdi, 1
  mov rsi, name
  mov rdx, 0xff 
  syscall
  ret
