
.section .text 

.globl _start

_start:
    movq $200, %rax 
    xorq %rcx, %rcx 
    jmp point_three 

    point_one:
        inc %rcx 
        addq $10, %rax
        
        cmp $3, %rcx 
        jge end 
        jmp point_four 

    point_two: 
        subq $10, %rax 
        jmp point_one 

    point_three:
        movq $4, %rbx 
        divq %rbx 
        jmp point_two

    point_four: 
        addq $2, %rax 
        jmp point_two 

    end:
        movq %rax, %rdi 
        movq $60, %rax 
        syscall 
