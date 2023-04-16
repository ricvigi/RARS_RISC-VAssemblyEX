# print the sum of the items of the list RECURSIVELY

.data

lista : .word node1 # "lista" è un pointer al primo elemento della lista

node1 : .word 8, node2

node2 : .word -5, 0 # pointer "0" to say it's last element of list

.text
lw a0, lista		# load into "a0" the address pointing to the first element
jal ra, sommalista 	# jump to "sommalista" and store the return address of command "li a7, 1" into "ra"
li a7, 1
ecall
li a7, 10
ecall

sommalista :
bne a0, zero, recursive	# if a0 != 0: go to "recursive"
jalr zero, ra, 0
recursive : 
addi sp, sp, -8		# subtract 8 from the Stack Pointer address --> make room for two elements in the stack
sw ra, 0(sp)		# save the value of "ra" register on top of the stack
sw a0, 4(sp)		# save the value of "a0" register on top of the stack
lw a0, 4(a0)		# load into a0 the content of 4(a0) (next pointer)
jal ra, sommalista	# jump to "sommalista" and store the return address of command "lw t0, 4(sp)" into "ra"
lw t0, 4(sp)		# load into "t0" address of current number
lw t1, 0(t0)		# load into "t1" current number
add a0, a0, t1		# add current number to counter
lw ra, 0(sp)		# load into "ra" next return address in the stack
addi sp, sp, 8		# add 8 to the stack pointer (remove two elements from the stack)
jalr zero, ra, 0	# set "x0" to return address (remains 0) and jump to statement at "ra" + immediate


# base case for this function is empty list




