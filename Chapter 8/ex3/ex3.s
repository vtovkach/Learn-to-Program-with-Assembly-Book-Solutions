
# Add two 320-bit values 

.globl _start

.section .data
num_a:
    .quad 0b10, 0b10, 0b10, 0b10, 0b01
num_b: 
    .quad 0b10, 0b10, 0b10, 0b10, 0b01

result:
    .quad 0, 0, 0, 0, 0

.section .text 
_start:
    lea num_a,  %rdi
    lea num_b,  %rsi
    mov $0, %rbx 
    mov $5, %rcx

    # Enable carry flag 
    clc

mainloop:
    mov (%rdi), %rax
    mov (%rsi), %rdx   

    adc %rdx, %rax 
    
    mov %rax, result(,%rbx, 8)

    inc %rbx 
    add $8, %rdi 
    add $8, %rsi 
    loop mainloop

end:
    mov $60, %rax 
    xor %rdi, %rdi 
    syscall 
