#MEI solution for adding elements of a list

.data
.word 6
.word 3, 5, 11, 12, 21, 27
#"in the memory, at offset 0 you find the lenght, and then at offset 4 you have (3), at 8 you have (5)..."
.text
lui s0, 0x10010
lw t1, 0(s0) # t1 stores counter
add a0, zero, zero #add 0 into register a0.

#IT IS GOOD PRACTICE TO PUT 0 INTO A REGISTER, IF WE NEED IT (even if your software does it automatically)

ori s1, s0, 4 #add into s1 the sum between s0 and 4 (first item of array)
ciclo:lw t0, 0(s1) #load into t0 the first item of the array
add a0, a0, t0 #add the first item into a0
addi s1, s1, 4 #add 4 to s1, so it points to next item in array
addi t1, t1, -1 #decrement the counter
bne t1, zero, ciclo #if t1 is equal to 0, we're done 
ori a7, zero, 1 #put into register A7 the code to print, that is 1
ecall
ori a7, zero, 10 #put into register A/ the code to exit, that is 10
ecall#we're done