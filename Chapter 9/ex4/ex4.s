
.globl _start

.section .data 
bitFlag:
    .byte 0b0011111
valueA:
    .byte 0b11100
valueB:
    .byte 0b11010
valueC:
    .byte 0b11111

.section .text 
_start:
    # Clear rax, rcx  
    xorq %rax, %rax
    xorq %rcx, %rcx  

    # Move values bytes from memory to al, cl registers 
    movb valueA, %al
    movb valueB,  %cl
    andb %cl, %al 
    movb valueC, %cl 
    and %cl, %al 
    movb bitFlag, %cl 
    and %cl, %al 

    xor %rdi, %rdi 
    movw %ax, %di
    
    mov $60, %rax 
    syscall 
