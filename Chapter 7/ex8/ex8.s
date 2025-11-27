
.globl _start

.section .text 
_start:
    leaq people, %rbx
    movq numPeople, %rcx 
    xorq %rdi, %rdi 

    cmp $0, %rcx 
    jz end 

mainloop:
    movq NAME_PTR_OFFSET(%rbx), %rdx 
    xor %rax, %rax 

loop_string:
    cmpb $0, (%rdx)   
    jz end_string_loop
    inc %rax
    inc %rdx 
    jmp loop_string 

end_string_loop:
    cmp %rdi, %rax 
    jbe loop_check 
    
    movq %rax, %rdi 

loop_check:
    addq $PERSON_RECORD_SIZE, %rbx
    loop mainloop

end:
    movq $60, %rax 
    syscall 
