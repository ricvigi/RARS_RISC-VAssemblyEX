# let v be an array of integers in the data segment, and x and y two integers
# Write a Risc-V program, both data and text segment, that counts the number of elements
# of the array that are equal to x or equal to y and prints the resultt.
# EXAMPLE: v = [4, -2, 3, 4, 4, 3, 1], x = 4 and y = 3. The number to print is 5
.data
.word 4, 3
.word 4, -2, 3, 4, 4, 3, 3, 3, 3, 1
.text
lui s0, 0x10010
# load number x into a1
lw a1, 0(s0)
# load number y into a2
lw a2, 4(s0)
# let a3 be our counter
addi a3, a3, 0
# move s0 to array[0]
addi s0, s0, 8
ciclo:
# store CURRENT number in t0
lw t0, 0(s0)
# check if CURRENT == 0
beq t0, zero, fine
# compare CURRENT to x
beq t0, a1, IfEqual
# compare CURRENT to y
beq t0, a2, IfEqual
# move pointer to next element in array
addi s0, s0, 4
j ciclo
IfEqual: addi a3, a3, 1
# move pointer to next element in array
addi s0, s0, 4
j ciclo
# if array is over, print result
fine: add a0, a0, a3
ori a7, zero, 1
ecall
ori a7, zero, 10
ecall


