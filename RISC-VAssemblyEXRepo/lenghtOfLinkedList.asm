# LINKED LIST (compute the lenght of the list)

.data 0x10010000
n01:	.word 7, n02
n04:	.word 8, 0
n02:	.word 11, n03
n03:	.word -2, n04
lista:	.word n01

.text
lw s0, lista #  the assembler translsates for you lui s0, 0x10010 and lw s* *(n01)
li a0, 0 
beq s0, zero, fine # CHECK IF THE LIST IS EMPTY (if address stored in s0 does not exist, list is empty)
ciclo: lw s0, 4(s0) # load next address
addi a0, a0, 1 # update the counter
bne s0, zero, ciclo # when next node is 0, end of list is reached

fine: li a7, 1
ecall
ori a7, zero, 10
ecall