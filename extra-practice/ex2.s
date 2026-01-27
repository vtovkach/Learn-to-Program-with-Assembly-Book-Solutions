
# Given two 32-bit integers stored in memory, determine and output the larger value.

.globl _start 

.section .data 
input_a:
    .long 200
input_b:
    .long 201

.section .text 
_start:
    xor %rax, %rax 
    movl input_a, %eax 

    cmpl input_b, %eax   
    jns end 

    movl input_b, %eax 
exit:
    # End of the program 
    movq %rax, %rdi 
    movq $60, %rax  
    syscall 
