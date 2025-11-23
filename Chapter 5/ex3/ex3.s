

.section .text
.globl _start

_start:

    movq $2, %rbx 
    movq $8, %rcx 
    movq $1, %rax 
    
    # If exponent is 0 then just leave the program 
    cmp $0, %rcx 
    je complete

    mainloop: 
        mulq %rbx 
        loop mainloop

    complete:
    # End of the program
        movq %rax, %rdi  
        movq $60, %rax
        syscall  
