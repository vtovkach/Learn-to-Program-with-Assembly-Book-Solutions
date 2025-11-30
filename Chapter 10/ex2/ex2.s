
.globl _start 

.section .data 
myString:
    .ascii "Hello World!\n"
endString:

.equ STRING_LEN, endString - myString

.section .text 
_start:

    # Set up loop counter 
    mov $10, %rcx 

mainloop:

    # Save rcx to preserve counter across syscalls  
    push %rcx 

    # Prepare System Call 
    mov $1, %rax
    mov $1, %rdi 
    lea myString, %rsi 
    mov $STRING_LEN, %rdx 
    syscall 

    pop %rcx 
    loop mainloop

    # Exit the program 
    mov $60, %rax
    xor %rdi, %rdi 
    syscall 
    