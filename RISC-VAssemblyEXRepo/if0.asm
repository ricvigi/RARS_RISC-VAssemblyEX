.data #0x10010000
.word 2
.asciz "zero"
.asciz "non_zero"
.text
lui s0, 0x10010
ori a0, s0, 0x04
addi a7, zero, 4
addi t2, zero, 15
lw t0, 0(s0)
beq t0, zero, salta
ori a0, s0, 9

salta: ecall