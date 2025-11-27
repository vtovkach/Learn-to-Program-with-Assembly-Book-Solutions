
.section .data 

.globl people, people_size 
people_size:
    .quad (endPeople - people) / PERSON_RECORD_SIZE 

# person's weight, person's hair color, persons's height, person's age 
people:
    .quad 200, 2, 74, 20
    .quad 280, 2, 72, 44
    .quad 150, 1, 68, 30
    .quad 250, 3, 75, 24
    .quad 250, 2, 70, 100
    .quad 180, 5, 69, 4
    .quad 180, 2, 69, 65
    .quad 180, 1, 69, 1
endPeople: 

.globl WEIGHT_OFFSET, HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET 
.equ WEIGHT_OFFSET, 0
.equ HAIR_OFFSET, 8
.equ HEIGHT_OFFSET, 16
.equ AGE_OFFSET, 24 

.globl PERSON_RECORD_SIZE 
.equ PERSON_RECORD_SIZE, 32 
