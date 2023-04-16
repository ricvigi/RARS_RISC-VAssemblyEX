.data
lista: .word n01
n01:   .word 5, n02
n02:   .word 63, n03
n03:   .word 23, n04
n04:   .word 45, n05
n05:   .word 1123, 0
.text

# Write a function to count the lenght of a linked list

lui s1, 0x10010
lw s0, 0(s1)
addi t0, zero, 1 	# initialize counter variable
jal ra, count_length    # jump to "count_length" and store into "ra" return address (line 16)
j Print_a0

count_length:           # to count elements in the linked list, we only consider pointers
			# WE DON'T CARE ABOUT THE ACTUAL VALUES	
    beq s0, zero, count # jump to "count" if s0 == 0 (we arrived at last element in list
    addi sp, sp, -8     # free space for 2 items in sp (each item occupies a word)
    sw t0, 0(sp)        # push "1" (t0) on top of the stack
    sw ra, 4(sp)	# push the return address "ra" on top of the stack
    addi s1, s1, 8      # add 8 to s1, so that s1 has the address of next pointer
    lw s0, 0(s1)	# load next pointer into s0
    jal ra, count_length# jump to count_length and store the return address (line 27) in "ra" 
  			# By doing this the return address stored in the stack will always  
  			# point to  "lw t0, 0(sp)", EXCEPT FOR THE FIRST ra STORED (line 15),
  			# that will be the last address to be loaded!
  
count:  
    lw t0, 0(sp)	# load the value 1, previously stored in the stack, into t0.
    			# If we are here, it means that s0 == 0, so that s0 is pointing to
    			# the end of the linked list. we are finished traversing the list,
    			# and we are ready to sum up all of the "1s" stored in the stack,
    			# each representing one item in the linked list
    lw ra, 4(sp)	# load into ra the last return address stored in the stack (it will 
    			# point to line 32)
    add a0, a0, t0	# add 1 to a0
    addi sp, sp, 8	# POP two elements from the stack
    jalr zero, ra, 0	# go back to the current return address
  
         
# Write a function to sum all of the elements of a linked list
lw s0, lista
 
# 				      |-----------"simpler approach"----------|
# 					lw a0, 0(s0) # "5" address is in a0
# 					lw t0, 0(a0) # now 5 is in t0
addi a0, zero, 1
jal ra, traverse	# jump to traverse and save return address (line 46) into sp
			# Here we sum the values and return to saved addresses (always here)
lw ra, 0(sp)
beq ra, zero, Print_a0
lw t0, 4(sp)
add a0, a0, t0
addi sp, sp, 8
jalr zero, ra, 0

traverse: 
    beq a0, zero, GoBackAndSum
    beq t0, zero, first
    lw a0, 0(t0)
  normal:
      addi s0, s0, 8
      addi sp, sp, -8
      sw ra, 0(sp)
      sw a0, 4(sp)
      lw a0, 0(s0)
      j traverse


  GoBackAndSum:
      lw ra, 0(sp)
      addi a0, zero, 0 # set a0 == 0
      jalr zero, ra, 0

  first:  
      lw a0, 0(s0)
      j normal


Print_a0:
    addi a7, zero, 1
    ecall
    j Exit
    
Exit:
    addi a7, zero, 10
    ecall
