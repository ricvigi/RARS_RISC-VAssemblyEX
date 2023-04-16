# Given two integers x and y in the data segment,
# print all the integers in the interval [x, y).

.data
x:   .word 1
y:   .word 10
sep: .asciz "/"
.text

addi s0, zero, 0
addi a0, zero, 0
addi t0, zero, 0
addi t1, zero, 0
addi t2, zero, 0

lui s0, 0x10010

lw t0, 0(s0)		# load "x" into t0
lw t1, 4(s0)		# load "y" into t1
lb t2, 8(s0)

ciclo:
    #beq t0, t1, exit
    add a0, zero, t0
    addi t0, t0, 1
    j printInteger
    
printInteger:
    addi a7, zero, 1
    ecall
    beq t0, t1, exit
printString:
    add a0, zero, t2
    addi a7, zero, 11
    ecall
    j ciclo
exit:
    addi a7, zero, 10
    ecall