# assembly-macosx
심심할 때 인텔 기반 맥에서 어셈블리어를 작성해보자

## How to execute the Assembler

```bash
>$ nasm -f macho64 <.asm 파일>

>$ ld -macosx_version_min 10.7.0 -o <execution 파일명> <object 파일명>

>$ ./<execution 파일명>
```

## 레지스터(64비트)
아래는 많이 사용한다는 레지스터의 의미이다.

| Register | Conventional use | Low 32-bits | Low 16-bits | Low 8-bits |
| --------- | --------- | --------- | --------- | --------- |
| %rax	|Return value, | callee-owned	| %eax	| %ax	|%al	|
| %rdi	|1st argument, | callee-owned	| %edi	| %di	|%dil 	|
| %rsi	|2nd argument, | callee-owned	| %esi	| %si	|%sil	|
| %rdx	|3rd argument, | callee-owned	| %edx	| %dx	|%dl	|
| %rcx	|4th argument, | callee-owned	| %ecx	| %cx	|%cl	|
| %r8	|5th argument, | callee-owned	| %r8d	| %r8w |%r8b	|
| %r9	|6th argument, | callee-owned	| %r9d	| %r9w |%r9b	|
| %r10	|Scratch/temporary, | callee-owned	|%r10d	|%r10w	|%r10b	|
| %r11	|Scratch/temporary, | callee-owned	|%r11d	|%r11w	|%r11b	|
| %rsp	|Stack pointer, | caller-owned	|%esp	|%sp	|%spl	|
| %rbx	|Local variable, | caller-owned	|%ebx	|%bx	|%bl	|
| %rbp	|Local variable, | caller-owned	|%ebp	|%bp	|%bpl	|
| %r12	|Local variable, | caller-owned	|%r12d|	%r12w	|%r12b	|
| %r13	|Local variable, | caller-owned	|%r13d|	%r13w	|%r13b	|
| %r14	|Local variable, | caller-owned	|%r14d|	%r14w	|%r14b	|
| %r15	|Local variable, | caller-owned	|%r15d|	%r15w	|%r15b	|
| %rip	|Instruction pointer				|
| %eflags	|Status/condition code bits		|


## MacOS vs Linux
### Syscall
첫번째 맥에서와 리눅스 기반 시스템에서 nasm syntax의 차이는 system call에서 있다.
예를 들어
```
# Write 작업에 대한 system call은
맥: 0x02000004
리눅스: 1

# Exit 작업에 대한 system call은
맥: 0x02000001
리눅스: 60
```
이렇게 다르다
## 참고자료
 - University of Chicago [자료](https://www.classes.cs.uchicago.edu/archive/2009/spring/22620-1/docs/handout-03.pdf)

 - Brown Univeristy [자료](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)

 - LMU [자료](https://cs.lmu.edu/~ray/notes/nasmtutorial/)

 - Stanford University [자료](https://web.stanford.edu/class/cs107/guide/x86-64.html)

 - NASM [자료](https://www.nasm.us/xdoc/2.11.06/html/nasmdoc3.html#section-3.2.2)