
# Count brown people with brown and blonde hair 
# Brown  is 2
# Blonde is 3 

.globl _start

.section .text 
_start:
    xorq %rax, %rax  
    leaq people, %rbx
    movq people_size, %rcx 
    xorq %rdi, %rdi 

    # Check entry condition 
    cmp $0, %rcx 
    je end

mainloop:
    movq HAIR_OFFSET(%rbx), %rax 

    cmp $2, %rax 
    jz increment 

    cmp $3, %rax 
    jnz loop_check

increment:
    inc %rdi

loop_check: 
    addq $PERSON_RECORD_SIZE, %rbx
    loop mainloop

end:
    movq $60, %rax 
    syscall 
