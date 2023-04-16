.data
n: .word 2 # rows
m: .word 2 # columns
a: .word 4, -1, 0, 1

.text

# compute the Trace if A
la s0, a
lw s1, n 
li a0, 0
lw t2, m
slli t2, t2, 2
addi t2, t2, 4
ciclo: lw t0, 0(s0)
add a0, a0, t0
addi s0, s0, t2
addi s1, s1, -1
bne s1, zero, ciclo








