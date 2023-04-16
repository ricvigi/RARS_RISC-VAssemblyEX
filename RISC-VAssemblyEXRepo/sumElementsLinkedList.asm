# print the sum of the items of the list

.data

lista : .word node1 # "lista" è un pointer al primo elemento della lista

node1 : .word 8, node2

node2 : .word -5, node3

node3 : .word 6, node4

node4 : .word 1, node5
 
node5 : .word 12, 0 # pointer "0" to say it's last element of list

.text
lw s0, lista 
li a0, 0 # use a0 to store the sum
beq s0, zero, fine # check if s0 (the pointer to the list) is zero == EMPTY LIST
ciclo : lw t0, 0(s0)
add a0, a0, t0
lw s0, 4(s0) # load into s0 the address of the next node (stored in the pointer)
bne s0, zero, ciclo
li a7, 1
ecall
li a7, 10
