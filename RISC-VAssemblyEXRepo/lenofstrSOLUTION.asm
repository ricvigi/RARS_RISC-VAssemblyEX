.data 
  .asciz "acsai è fighissimo"
.text
    lui s0, 0x10010
    addi t3, zero, 0
 ciclo:lb t0, 0(s0)
    beq t0, zero, fine
    addi a0, a0, 1
    addi s0, s0, 1
    beq zero, zero, ciclo    
 fine:ori a7, zero, 11 # 1 is the CODING OF THE PRINT STRING
 ecall
 ori a7, zero, 10
 ecall
