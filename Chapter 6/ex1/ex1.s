
.globl _start

.section .data 
array_size:
    .quad 7

array:
    .quad 5, 20, 33, 80, 52, 10, 1 

.section .text 
_start:
    movq $0, %rdi      
    movq array_size, %rcx
    movq $0, %rsi 
    leaq array, %rbx  
    
    cmp $0, %rcx  
    je end

mainloop:
    movq (%rbx, %rsi, 8), %rax
    inc %rsi

    cmp %rdi, %rax  
    jb loop_cont  
    movq %rax, %rdi 

loop_cont:
    loop mainloop

end:
    movq $60, %rax
    syscall 
