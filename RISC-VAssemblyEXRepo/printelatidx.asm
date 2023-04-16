.data
.word 4
#.word 6
.word 3,5,11,12,21,27

.text
lui s0, 0x10010 #load into s0 .data address
addi s0, s0, 20 #add into s0 address of item at position 4(4*5 because pos 4 is 5th element)
lw a0, 0(s0)#load the value stored at address a0
addi a7, zero, 1#put code 1 (print) into a7
ecall#call the sys so that it prints
ori a7, zero, 10 #load into A7 EXIT code (10)
ecall#call to exit