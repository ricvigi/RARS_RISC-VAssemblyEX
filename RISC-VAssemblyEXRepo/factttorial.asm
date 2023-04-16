# find the factorial of a number
.data 
.word 6
.text
lui t0, 0x10010
lw t1, 0(t0) # store result here
addi t2, t1, -1# t2 = n-1, needed for factorial
ciclo:
mul t1, t1, t2# multiply
beq t2, x0, fine
addi t2, t2,  -1# decrement "multiplier"
add t3, t2, x0
bne t3, x0, ciclo
fine:addi a0, t1, 0# store into a0 WHAT YOU WANT TO PRINT
addi a7, zero, 1# store into a7 code 1 TO PRINT AN INTEGER(our factorial)
ecall








