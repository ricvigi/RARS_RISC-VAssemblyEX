#print all the numbers in the interval [x, y)
.data
.word 6, 11
.text

lui s0, 0x10010
lw a0, 0(s0) # first number in interval
lw t1, 4(s0) # last number in interval
ciclo: bge a0, t1, fine
ori a7, zero, 1
ecall
addi a0, a0, 1
j ciclo

fine: 
ori a7 zero, 10
ecall
