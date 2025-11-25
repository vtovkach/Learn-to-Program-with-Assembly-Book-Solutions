
# Program to find the minimum value from the array of numbers

.globl _start

.section .data 
array_size:
    .quad 7

array:
    .quad 5, 20, 33, 80, 52, 10, 1 

.section .text 
_start:
    movq $0, %rax
    leaq array, %rbx 
    xorq %rcx, %rcx
    movq array, %rdi  
    
    cmpq %rax, array_size
    je end

mainloop:
    movq (%rbx, %rcx, 8), %rax 
    inc %rcx 

    cmp %rdi, %rax 
    jge check_loop
    movq %rax, %rdi

check_loop:
    cmp array_size, %rcx 
    jb mainloop  

end:
    movq $60, %rax 
    syscall 
