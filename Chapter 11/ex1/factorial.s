
.globl factorial

.section .text 
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
