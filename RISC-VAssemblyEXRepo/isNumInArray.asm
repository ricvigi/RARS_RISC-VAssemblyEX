.data
x : .word 6
n : .word 5
y : .word 7, -2, 6, 1, 1
.text
# --- if x is in the array y, print 1, otherwise print 0 ---
lui s0, 0x10010
addi s0, s0, 8 # load into s0 the offset needed to go through the array
lw t0, x
lw s1, n
ciclo : lw t1, 0(s0)
beq t1, t0, found
addi s0, s0, 4
addi s1, s1, -1
bne s1, zero, ciclo
li a0, 0
li a7, 1
ecall
li a7, 10
ecall
found : li a0, 1
li a7, 1
ecall
li a7, 10
ecall


