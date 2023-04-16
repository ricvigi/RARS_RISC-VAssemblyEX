.data 
.asciz "IT WORKS"
.text
lui s0, 0x10010
addi t1, zero, 0 # t1 is our COUNTER
ciclo:
  lb t2, 0(s0) # LOAD into t2 BYTE containing LETTER
  beq t2, zero, fine # CHECK if in t2 is stored the value 0 (value for END OF STRING),
  		     # IF IT IS == 0, go to "fine"
  addi t1, t1, 1 # ADD into t1 (counter) the sum between t1 and 1 (upgrade counter by 1)
  addi s0, s0, 1 # ADD 1 to the address that points to the letter in the string
  #bne t2, zero, ciclo # IF t2 is not == 0, go back up ### THIS IS A CHECK USED TO IMPLEMENT THE LOOP 
  j ciclo		      #  			(should it be there?)
fine:add a0, zero, t1 # put into a0 the content of t1 (len(string) counter)
addi a7, zero, 1 # add into a7 code 1 (PRINT INTEGER)
ecall