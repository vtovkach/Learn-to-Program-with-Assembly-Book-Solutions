
.globl _start 

.section .text 
_start:
    mov $0b111000001000000000111, %rax 
    mov $64, %rcx
    xor %rdi, %rdi  

mainloop:
    test $1, %rax 
    jz loop_test 
    inc %rdi 

loop_test:
    shr $1, %rax 
    loop mainloop 

end:
    movq $60, %rax 
    syscall 
