# write a recursive functiton that inverts elements in the list
.data
lista : .word node1 
node1 : .word 8, node2
node2 : .word -5, node3
node3 : .word 6, node4
node4 : .word 54, node5
node5 : .word 12, node6
node6 : .word 11, 0
.text

lui s0, 0x10010
lui s2, 0x10010		# use this to store initial s0 value
jal ra, traverse
traverse:
    lw a0, 0(s0)
    beqz a0, goTo_ra
    lw t1, 0(a0)
    addi s0, s0, 8
    jal ra, comeBack
    add s0, zero, s2
    jal ra, change
change:    
    lw a0, 0(s0)
    beqz a0, printListHelper   
    lw t1, 0(sp)
    lw t2, 0(a0)
    sw t1, (a0)
    add a0, zero, t1
    addi s0, s0, 8
    addi sp, sp, 8
    jalr zero, ra, 0
comeBack:
    addi sp, sp, -8
    sw t1, 0(sp)
    lw t1, -4(s0)
    j traverse
goTo_ra:
    jalr zero, ra, 0  
printListHelper:
    add s0, zero, s2
    j printList
printList:
    lw t0, 0(s0)
    beqz t0, kill
    lw a0, 0(t0)
    addi a7, zero, 1
    ecall
    addi s0, s0, 8
    j printList
kill:
    addi a7, zero, 10
    ecall
    
