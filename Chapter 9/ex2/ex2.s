
# Find string length using

.globl _start 

.section .data
myString: 
    .ascii "Hello World Bye\0"

.section .text 
_start:
    xor %rax, %rax
    mov $-1, %rcx  
    lea myString, %rdi

    repne scasb
    
    sub $myString, %rdi 
    dec %rdi 

end:
    mov $60, %rax 
    syscall 
