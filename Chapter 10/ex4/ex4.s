
.globl _start

.section .data
string1:
    .ascii "Hello World!\n"
string2: 
    .ascii "Buenas Dias!\n"
endStrings:

.equ STR1_LEN, string2 - string1
.equ STR2_LEN, endStrings - string2

.section .text 
_start:

    xor %rax, %rax 
    # Set the counter to 10 
    mov $10, %rcx 

mainloop:  
    push %rax 
    push %rcx 

    cmp $0, %rax 
    jz printString1

    jmp printString2

testLoop:
    pop %rcx
    pop %rax
    xor $0x01, %rax  
    loop mainloop
    jmp end

printString1:
    mov $1, %rax 
    mov $1, %rdi 
    lea string1, %rsi 
    mov $STR1_LEN, %rdx 
    syscall 
    jmp testLoop

printString2:
    mov $1, %rax 
    mov $1, %rdi 
    lea string2, %rsi 
    mov $STR2_LEN, %rdx 
    syscall 
    jmp testLoop

end: 
    mov $60, %rax
    xor %rdi, %rdi 
    syscall 
