
.section .text 
.globl _start 

_start:
    # Prepare data 
    movq $8, %rax 
    movq $1, %rdi
    testq %rax, %rax 
    jz end 

mainloop:
    subq $2, %rax 
    cmp $0, %rax 
    je end 
    jl odd
    jmp mainloop 

odd:
    movq $0, %rdi
    
end:
    movq $60, %rax 
    syscall 
    