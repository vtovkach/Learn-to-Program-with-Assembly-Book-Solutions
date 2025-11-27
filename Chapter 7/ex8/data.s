
.section .data 

gkcname:
    .ascii "Gilbert Keith Chester\0"
jbname:
    .ascii "Jonathan Bartlett\0"
cslname:
    .ascii "Gilbert Keith Chester JOHN\0"

.globl people, numPeople 
numPeople:
    .quad (endPeople - people) / PERSON_RECORD_SIZE 
people:
    .quad gkcname, 200, 10, 2, 74, 20 
    .quad jbname, 280, 12, 2, 72, 44
    .quad cslname, 150, 8, 1, 68, 30
endPeople:

.globl NAME_PTR_OFFSET, WEIGHT_OFFSET, SHOE_OFFSET, HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET
.equ NAME_PTR_OFFSET, 0
.equ WEIGHT_OFFSET, 8
.equ SHOE_OFFSET, 16
.equ HAIR_OFFSET, 24
.equ HEIGHT_OFFSET, 32
.equ AGE_OFFSET, 40

.globl PERSON_RECORD_SIZE
.equ PERSON_RECORD_SIZE, 48
