.data
albero: .word n01
n01: .word -50, n02, 0
n02: .word 12, n05, n03
n03: .word -2, n08, n04
n04: .word 1, 0, 0
n05: .word 200, 0, n06
n06: .word 1, 0, n07
n07: .word 1, 0, 0
n08: .word -5, 0, n09
n09: .word 1, 0, 0 
.text 
lw a0, albero
jal conta
add a0, zero, s10
j exit

conta: bne a0, zero, ric
jalr zero, ra, 0 		# if no children, return
ric: addi sp, sp, -12
sw ra, 0(sp) 		
sw a0, 4(sp) 			
lw a1, 0(a0)
sw a1, 8(sp)
lw a0, 4(a0) 			
jal ra, conta
bgtz t1, addroot
lw a0, 4(sp)
lw a0, 8(a0) 			# load brother address
jal ra, conta 			# call the function on brother
lw t0, 8(sp)
add t1, t1, t0 
lw ra, 0(sp)
addi sp, sp, 12
jalr zero, ra, 0

addroot:			# add root of a tree to the sum of its children
  lw t2, 8(sp)
  add t1, t1, t2
  lw t3, 4(sp)
  lw t5, 0(t3)
  sw t1, 0(t3)
  sw t1, 8(sp)
  lw t4, 0(sp)
  blt t1, s10, return
  bgt t1, s10, update
  add s10, zero, t1
  add t1, zero, zero
  jalr zero, ra, 0

return:				# clear registers and return
  add t0, zero, zero	
  add t1, zero, zero
  add t2, zero, zero
  add a1, zero, zero
  jalr zero, ra, 0
update:				# update s10 value and clear registers
  add s10, zero, t1
  add t0, zero, zero	
  add t1, zero, zero
  add t2, zero, zero
  add a1, zero, zero
  jalr zero, ra, 0


exit:
  li a7, 1
  ecall
  li a7, 10
  ecall
