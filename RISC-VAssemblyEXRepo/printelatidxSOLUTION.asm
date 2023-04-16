.data
.word 4
.word 3, 5, 11, 12, 21, 27
.text
lui s0, 0x10010 #load into s0 base address
lw t0, 0(s0) #load number at address s0 (index of element we need)
ori s1, s0, 8 #place number 8 into s1
slli t0, t0, 2#shift t0 by 2 position to the left (multiply twice by 2)
add s1, s1, t0
lw a0, 0(s1)
ori a7, zero, 1
ecall
ori a7, zero, 10
ecall