
# Given an array of integers and its size, count and store in memory the number of positive and negative elements in the array.

.globl _start 

.section .data
beg_array:
    .quad 55, -67, 17, 18, -19, 20, 32, -77, -1233, 8934
end_array:

.section .bss
positives:  
    .skip 8
negatives: 
    .skip 8

.equ ARRAY_SIZE, (end_array - beg_array) / 8

.section .text
_start:

end:

    movq $60, %rax 
    syscall 

