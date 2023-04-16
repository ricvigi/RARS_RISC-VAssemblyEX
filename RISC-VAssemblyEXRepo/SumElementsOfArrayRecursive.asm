.data
length: .word 3
array:  .word 5,2,4

.text

# Write a recursive function to sum up all the values of an array of integers.
lui s0, 0x10010
addi a0, zero, 0
lw t0, 0(s0) 		# load into t0 length of array
addi s0, s0, 4
lw t1, 0(s0)		# load into t1 first element
jal ra, storeIF
addi a7, zero, 1
ecall
addi a7, zero, 10
ecall
storeIF:
    bne t0, zero, storeELSE
    jalr zero, ra, 0
storeELSE:
    addi sp, sp, -8
    sw t1, 0(sp)
    addi s0, s0, 4
    lw t1, 0(s0)
    addi t0, t0, -1
    sw ra, 4(sp)
    jal ra, storeIF
    lw t1, 0(sp)
    add a0, a0, t1
    lw ra, 4(sp)
    addi sp, sp, 8
    jalr zero, ra, 0
    
    

