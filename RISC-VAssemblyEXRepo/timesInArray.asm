.data
x : .word 6
n : .word 5
y : .word 7, -2, 0, 1, 1
.text
# --- print the number of times x appears in the array ---
lui s0, 0x10010
addi s0, s0, 8
lw t0, x
lw s1, n
addi s2, zero, 0
ciclo: beq s1, zero, fine
lw t1, 0(s0)
beq t0, t1, increment
addi s0, s0, 4
addi s1, s1, -1
j ciclo
increment : addi s2, s2, 1
addi s0, s0, 4
addi s1, s1, -1
j ciclo
fine : add a0, a0, s2
ori a7, zero, 1
ecall
ori a7, zero, 10
ecall