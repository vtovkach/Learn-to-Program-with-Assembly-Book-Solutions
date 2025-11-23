
.section .text 
.globl _start

_start:
    xorq %rax, %rax 
    movb $1, %al
    movb $1, %ah 

    xorq %rbx, %rbx 
    movw $100, %bx 

    xorq %rcx, %rcx 
    mov $1, %ecx 

    movq $60, %rax 
    xorq %rdi, %rdi 
    movw $1, %di 

    syscall 
