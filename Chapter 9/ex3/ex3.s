
.globl _start 

.section .data 
array: 
    .quad 50, 51, 101, 27, 17, 12, 13, 73, 99, 1001 
arraySize:
    .quad 10

.section .text 
_start:

    # Set Up Registers 
    mov $27, %rax 
    mov arraySize, %rcx
    lea array, %rdi  

    # Clear Dir Flag 
    cld 
    
    # Search for target(rax) in memory while rcx != 0 and ZF == 0
    repne scasq

    # ZF = 1 -> target found, ZF = 0 -> item not found 
    jz found 
    mov $255, %rdi  # 255 -> item is not found 
    jmp end 

found:
    # Calculate target index  
    sub $array, %rdi     
    shr $3, %rdi  
    dec %rdi 

end: 
    mov $60, %rax
    syscall 
