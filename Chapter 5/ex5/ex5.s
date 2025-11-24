
.section .text 
.globl _start 

_start:
    # Prepare values 
    movq $12, %rax 
    movq $2, %rbx 
    xorq %rdx, %rdx 

    # Divide RAX by RBX 
    divq %rbx

    # Check remainder 
    testq %rdx, %rdx 
    jz even 

    # Odd case 
    movq $0, %rdi 
    jmp end  
even:
    movq $1, %rdi

end:
    movq $60, %rax 
    syscall 
