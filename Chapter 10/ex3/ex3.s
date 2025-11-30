
.globl _start

.section .data 
oddMsg:
    .ascii "Number is Odd.\n"
evenMsg:
    .ascii "Number is Even.\n"
number:
    .quad 1

.equ ODD_MSG_LEN, evenMsg - oddMsg
.equ EVEN_MSG_LEN, number - evenMsg

.section .text 
_start:
    mov number, %rax 
    mov $2, %rbx
    xor %rdx, %rdx  
    div %rbx 

    # Prepare Syscall 
    mov $1, %rax
    mov $1, %rdi 

    # Check Even or Odd 
    cmp $0, %rdx 
    jz even 

    lea oddMsg, %rsi
    mov $ODD_MSG_LEN, %rdx 
    jmp end 

even:
    lea evenMsg, %rsi 
    mov $EVEN_MSG_LEN, %rdx 

end:
    # Print Message 
    syscall 

    # Exit the program 
    mov $60, %rax 
    xor %rdi, %rdi
    syscall 
 