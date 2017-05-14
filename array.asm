.text
    main:
    #greatest value
    jal gr_value
    #Print the biggest Number
    lw $a0, 0($t0)
    li $v0, 1
    syscall

    #Sum
    jal Sum
    #Print
    move $a0, $t1
    li $v0, 1
    syscall

    #exit strategy_1
    li $v0, 10
    syscall
    greatest_number:
    li $t5, 9
    la $t0, array #load first value into the array
    addi $t1, $t0, 4 #store

    #loop section
    loop:
    blez $t5, end
    lw $t3, 0($t1)
    lw $t4, 0($t0)
    sub $t2, $t3, $t4
    blez $t2, next
    move $t0, $t1

    #next cell section
    next:
    la $t1, 4($t1)
    addi $t5, -1
    j loop

    #exit strategy_2
    end:
    la $a0, word_1
    li $v0, 4
    syscall
    #return
    jr $ra

    #sum
    Sum:
    la $t0, my_array
    li $t5, 8
    lw $t1, 0($t0)

    #loop2 section for decrement and repeat
    loop2:
    blez $t5, end2
    addi $t5, $t5, -1 #decrement
    addi $t0, $t0, 4
    lw $t2, 0($t0)
    add $t1, $t1, $t2
    j loop2 #repeat the loop until iterator is out of range

    #end_2 for word_2
    end2:
    la $a0, word_2
    li $v0, 4
    syscall
    #return
    jr $ra

#data section
.data
    word_1: .asciiz "Greatest Number: "
    word_2: .asciiz "\nSum of Numbers: "
    #array per assignment instructions
    my_array: .word 11, 12, -10, 13, 9, 12, 14, 15, -20
