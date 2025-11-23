
.section .text 
.globl _start 

_start:
    xorq %rcx, %rcx  
    xorq %rax, %rax 
    movq $10100000000, %rcx 

    loop_entry:
        nop
        dec %rcx 
        jnz loop_entry 

    movq $60, %rax
    xorq %rdi, %rdi 
    syscall  
