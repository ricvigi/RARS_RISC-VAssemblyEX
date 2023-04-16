.data
.word 6
.word 3, 5, 11, 12, 21, 27
#"in the memory, at offset 0 you find the lenght, and then at offset 4 you have (3), at 8 you have (5)..."
.text
lui s0, 0x10010
lw t1, 0(s0) # t1 stores counter

ecall