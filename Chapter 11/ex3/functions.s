
.globl exponent, factorial, numberTest

.section .text 
exponent:

    push %rbp 
    mov %rsp, %rbp 
    sub $16, %rsp 

    # %rdi base 
    # %rsi exponent 

    mov $1, %rax 
    mov %rsi, %rcx 

    cmp $0, %rcx 
    jz endExp

mainloop:
    mul %rdi 
    dec %rcx 
    jnz mainloop

endExp: 
    mov %rbp, %rsp 
    pop %rbp
    ret 
    

factorial:

    push %rbp
    mov %rsp, %rbp
    sub $16, %rsp

    # Base Case 
    cmp $0, %rdi
    jnz continue

    mov $1, %rax
    mov %rbp, %rsp
    pop %rbp   
    ret 

continue:

    # Save and decrement value in %rdi 
    mov %rdi, -8(%rbp)  
    dec %rdi

    # Recursively call factorial function 
    call factorial

    # Multiply local variable by factorial's function return 
    mulq -8(%rbp)

    mov %rbp, %rsp 
    pop %rbp 
    ret 


numberTest:

    push %rbp 
    mov %rsp, %rbp 
    sub $16, %rsp

    # %rdi -> input number 

    mov %rdi, -8(%rbp)

    mov %rdi, %rax 
    xor %rdx, %rdx 
    mov $2, %rdi 
    div %rdi 

    cmp $0, %rdx 
    jne odd

    mov -8(%rbp), %rdi 
    call factorial
    jmp endNumTest

odd:
    mov -8(%rbp), %rdi
    mov $3, %rsi
    call exponent

endNumTest: 
    mov %rbp, %rsp 
    pop %rbp 
    ret
