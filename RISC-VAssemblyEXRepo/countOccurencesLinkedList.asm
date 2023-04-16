.data

lista: .word n01
n01: .word 1, n02
n02: .word 2, n03
n03: .word 1, n04
n04: .word 3, n05
n05: .word 1, n06
n06: .word 1, 0
.text
lw s0, lista # - la s0, lista - works as well
li t1, 1
li a0, 0
ciclo:
lw t0, 0(s0)
bne t0, t1, salta
addi a0, a0, 1
salta: lw s0, 4(s0) # load the address of next node
bne s0, zero, ciclo


li a7, 1
ecall
li a7, 10
ecall



