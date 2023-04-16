# write a function to compute the factorial of a number

.data
.word 5
.text 

lui s0, 0x10010
lw s1, 0(s0)
addi a0, zero, 1

ciclo:
    addi sp, sp, -4
    sw s1, 0(sp)
    addi s1, s1, -1
    beq s1, zero, here
    j ciclo
    
    
here: 
    lw s2, 0(sp)
    beq s2, zero, fin
    mul a0, a0, s2
    addi sp, sp, 4
    j here
 
fin:
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall  
    
    