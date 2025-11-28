
# Return 5th bit of a number 

.globl _start 

.section .text 
number:
    .quad 0x318

.section .text 
_start:
    mov number, %rax
    xor %rdi, %rdi 

    test $0x100, %rax
    jz end

    mov $1, %rdi

end:
    mov $60, %rax 
    syscall 
