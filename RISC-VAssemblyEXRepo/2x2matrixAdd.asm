.data
n: .word 2 # rows
m: .word 3 # columns
a: .word 4, -1, 3, 0, 1, 3

.text
# sum all of the items of a
#la s0, a
#lw s1, n
#lw s2, m
#lui t0, zero, zero # store the sum into t0
#add s3, s2, zero # temporary colums value
#ciclo: lw t1, 0(s0) # load value into t1
#addi s3, s3, -1

la s0, a # load array adress into s0
lw s1, n # load into s1 number of rows
li a0, 0

ciclo1: lw s2, m # load into s2 number of columns
ciclo2: lw t0, 0(s0) # load first element
add a0, a0, t0
addi s0, s0, 4
addi s2, s2, -1
bne s2, zero, ciclo2
addi s1, s1, -1
bne s1, zero, ciclo1
li a7, 1
ecall
li a7, 10
ecall
