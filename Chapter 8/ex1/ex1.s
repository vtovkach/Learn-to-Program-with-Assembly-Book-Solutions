
# Add 2 signed numbers and return 1 if overflow occurred, return 0 if overflow did not occur 

.globl _start

.section .text 
_start:
    movq $9223372036854775807, %rax  
    movq $1, %rcx
    addq %rcx, %rax 
    
    movq $1, %rdi 
    jo end 
    xorq %rdi, %rdi

end:    
    movq $60, %rax 
    syscall 
