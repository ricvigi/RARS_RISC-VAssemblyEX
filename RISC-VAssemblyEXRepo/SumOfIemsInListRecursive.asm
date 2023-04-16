# Write a recursive function that, given a linked list of integers, returns the sum of the items in the list.


.data

lista: .word n01 	# 0x10010004

n01: .word 8, n02	# 8, 0x100100c
n02: .word 5, n03
n03: .word -2, n04
n04: .word 5, 0

.text

lui s0, 0x10010
addi s0, s0, 4
lw s1, 0(s0)
addi a0, zero, 0
jal ra, A
A:
    beq s1, zero, fine
    jal ra, B

B:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s1, 4(sp)

    jalr zero, ra, 0

fine: ori a7, zero, 1
ecall









