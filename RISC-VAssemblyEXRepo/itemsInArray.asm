.data 
n: .word 8
v: .word 5,8,-3,0,1,1,7,2
x: .word 1
y: .word  8
.text
# count the number of items of v that are equal to x or to y

la s0, v # LoadAddress of v into s0
lw s1, n # LoadWord of n into s1
li a0, 0 # LoadImmediate 0 into a0
lw s2, x
lw s3, y
ciclo: 
lw t0, 0(s0)
bne t0, s2, salta
addi a0, a0, 1
j salta2
salta: bne t0, s3, salta2
addi a0, a0, 1
salta2: addi a0, s0, 4
addi s1, s0, -1
bne s1, zero, ciclo
jal printAndExit
printAndExit:
li a7, 1
ecall
li a7, 10
ecall