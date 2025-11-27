
# Find youngest age 

.globl _start

.section .text 
_start:
    leaq people, %rbx 
    movq people_size, %rcx
    xorq %rdi, %rdi  

    cmp $0, %rcx 
    jz end 

    movq AGE_OFFSET(%rbx), %rdi
    
mainloop:
    movq AGE_OFFSET(%rbx), %rax 

    cmp %rdi, %rax  
    jge loop_check 
    
    movq %rax, %rdi 

loop_check:
    addq $PERSON_RECORD_SIZE, %rbx  
    loop mainloop

end:
    movq $60, %rax 
    syscall 
