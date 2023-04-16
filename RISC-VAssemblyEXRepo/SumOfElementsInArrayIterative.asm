# Write an iterative function to sum up all the values of an array of integers.
.data
length: .word 6
list:   .word 12, 4, 8, 34, 11, 545

.text
addi s0, zero, 0	# |
addi a0, zero, 0	# set necessary registers to 0
addi t0, zero, 0	# |
addi t1, zero, 0

lui s0, 0x10010		# load data address into s0
lw t0, 0(s0)		# store list length into register t0


ciclo: 
    addi s0, s0, 4
    lw t1, 0(s0)
    beq t0, zero, fine
    add a0, a0, t1
    addi t0, t0, -1
    j ciclo

fine:
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall