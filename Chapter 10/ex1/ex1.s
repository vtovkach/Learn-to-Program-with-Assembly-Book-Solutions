
.globl _start 

.section .text 
string1:
    .ascii "Hello World "
string2:
    .ascii "from Vadym!\n"
end_string:

.equ STRING1_LEN, string2 - string1  
.equ STRING2_LEN, end_string - string2 

.section .text 
_start:
    # Print first String 
    mov $1, %rax        # syscall num 
    mov $1, %rdi        # file descriptor
    lea string1, %rsi   # pointer to the string 
    mov $STRING1_LEN, %rdx 
    syscall

    # Print the second string 
    mov $1, %rax
    mov $1, %rdi 
    lea string2, %rsi 
    mov $STRING2_LEN, %rdx  
    syscall 

    # Exit the program 
    mov $60, %rax 
    xor %rdi, %rdi 
    syscall 
