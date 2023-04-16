# write a recursive function to compute the factorial of a number

.data
.word 2
.text

lui s0, 0x10010
lw a0, 0(s0)
jal ra, factorial
addi a7, zero, 1
ecall
addi a7, zero, 10
ecall


factorial:
    bne a0, zero, fact
    addi a0, zero, 1
    jalr zero, ra, 0
    fact:
        addi sp, sp, -8
        sw a0, 0(sp)
        sw ra, 4(sp)
        addi a0, a0, -1
        jal factorial
        lw t0, 0(sp)
        mul a0, a0, t0
        lw ra, 4(sp)
        addi sp, sp, 8
        jalr zero, ra, 0
        
    

  