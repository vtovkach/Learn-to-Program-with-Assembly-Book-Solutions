
# Exercise #1 
# Given a 32-bit integer stored in memory, write a program that computes and stores three bytes: is_zero, is_negative, and parity_low_byte.

.globl _start

.section .data 
input_integer:
    .long 0
is_zero:
    .byte 0
is_negative:
    .byte 0 
parity_low_byte:
    .byte 0 

.section .text 
_start:
    xorq %rax, %rax  
    leaq input_integer, %rbx
    movl (%rbx), %eax 

    testl %eax, %eax 
zero:
    jnz neg 
    leaq is_zero, %rbx 
    movb $1, (%rbx)

neg:    
    jns parity_low
    leaq is_negative, %rbx
    movb $1, (%rbx)

parity_low: 
    jnp end 
    leaq parity_low_byte, %rbx 
    movb $1, (%rbx)

end: 
    # Output parity_low_byte 
    xor %rdx, %rdx 

    orb (%rbx), %dl
    shl $1, %rdx

    # Output is_negative 
    leaq is_negative, %rbx
    orb (%rbx), %dl 
    shl $1, %rdx

    # Output is_zero 
    leaq is_zero, %rbx 
    orb (%rbx), %dl 

    movq %rdx, %rdi 

    # Return from the program 
    movq $60, %rax  
    syscall 


