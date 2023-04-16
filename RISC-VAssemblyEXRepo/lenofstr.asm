.data 
  .asciz "acsai è fighissimo"
.text
    lui s0, 0x10010
    addi t3, zero, 0
    bne s0, t3, salta
    salta: lb s0, 1(s0)
    addi t3, zero, 1
    
    


