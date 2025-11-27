
# Find youngest age and save index of the entry 

# RDX contains current smallest age 
# RDI contains the index of the current smallest age 

.globl _start

.section .text 
_start:
    leaq people, %rbx 
    movq $0, %rcx
    xorq %rdi, %rdi  

    cmp %rcx, people_size 
    jz end 

    movq AGE_OFFSET(%rbx), %r8

loop_check:
    cmp %rcx, people_size 
    jz end

mainloop:
    movq $PERSON_RECORD_SIZE, %rax
    mulq %rcx 
    movq %rax, %rsi 
    
    movq AGE_OFFSET(%rbx, %rsi, 1), %rax 

    cmp %r8, %rax 
    jge jmp_loop_check

    movq %rax, %r8 
    movq %rcx, %rdi 

jmp_loop_check:
    inc %rcx 
    jmp loop_check  

end:
    movq $60, %rax 
    syscall 
