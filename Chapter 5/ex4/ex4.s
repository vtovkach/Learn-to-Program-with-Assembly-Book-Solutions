
.section .text
.globl _start

_start:
    # rax: multiplicand | rcx: multiplier 
    movq $0, %rax 
    movq $5, %rbx 
    movq $5, %rcx 

    # See if multiplier is 0  
    cmp $0, %rcx 
    je end

mainloop:
    # Add number in %rbx to number in %rax and save it in %rax  
    addq %rbx, %rax 
    loop mainloop

end:
    movq %rax, %rdi 
    movq $60, %rax 
    syscall 
