
.section .text 
.globl _start 

_start:
    movq $60, %rax
    movq $100, %rdi  
    syscall 
