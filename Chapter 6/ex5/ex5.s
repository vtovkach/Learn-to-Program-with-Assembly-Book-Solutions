# Perform Linear Search to find a target number  

.globl _start 

.section .data 
target:
    .quad 100

array_size: 
    .quad 10

array: 
    .quad 10, 23, 1, 2, 16, 17, 19, 40, 57, 12

.section .text
_start:
    movq target, %rax
    leaq array, %rbx
    xorq %rcx, %rcx 
    movq array_size, %rdx  
    xorq %rdi, %rdi 

    cmp %rcx, array_size
    je end 

mainloop:
    cmp %rax, (%rbx, %rcx, 8)
    je target_found 
    inc %rcx 
    jmp loop_cont

target_found:
    movq $1, %rdi 
    jmp end  

loop_cont: 
    cmp %rdx, %rcx 
    jb mainloop
 
end:
    movq $60, %rax 
    syscall 
    