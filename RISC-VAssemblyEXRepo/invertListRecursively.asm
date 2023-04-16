# write a recursive function that inverts the list and returns the new head.

.data

lista : .word node1 # "lista" è un pointer al primo elemento della lista
node1 : .word 8, node2
node2 : .word -5, node3
node3 : .word 6, node4
node4 : .word 1, node5
node5 : .word 12, 0 # pointer "0" to say it's last element of list

.text
lw a0, lista		# load into a0 address pointing to lista
jal ra, inverti		# go to "inverti"
li a7, 1
ecall
li a7, 10
ecall

inverti :
bne a0, zero, base2
jalr zero, ra, 0
base2 : lw t0, 4(a0)
bne t0, zero, ric
jalr zero, ra, 0
ric : addi sp, sp, -8
sw ra, 0(sp)
sw a0, 4(sp)
lw a0, 4(a0)
jal ra, inverti
lw t0, 4(sp)
lw t1, 4(t0)
sw t0, 4(t1)
sw zero, 4(t0)
lw ra, 0(sp)
addi sp, sp, 8
jalr zero, ra, 0

ori a7, zero, 10
ecall 
