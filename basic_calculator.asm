.text
    main:
    #display instructions
    la $a0, instructions
    li $v0, 4
    syscall

    #handle first number
    la $a0, num_1 # load the addr of hello_msg into $a0.
    li $v0, 4 # 4 is the print_string syscall.
    syscall # do the syscall.

    #storing the first number via prompt
    li $v0, 5
    syscall
    move $t0, $v0

    #handle second value
    la $a0, num_2
    li $v0, 4 # 4 is the print_string syscall.
    syscall # do the syscall.

    #storing the second number via prompt
    li $v0, 5
    syscall
    move $t1, $v0

    #get operator type
    la $a0, op_value
    li $v0, 4 # 4 is the print_string syscall.
    syscall # do the syscall.

    #storing the op type via prompt
    li $v0, 5
    syscall
    move $t2, $v0

    #operation type logic(s)
    #checking for zero
    beq $t2, $zero, add_l
    #checking for one
    li $t4, 1
    beq $t2, $t4, sub_l
    #checking for 2
    li $t4, 2
    beq $t2, $t4, mult_l

    #labels-------------
    add_l:#add
          add $t3, $t0, $t1
          b done
    #subtract
    sub_l:
          sub $t3, $t0, $t1
          b done
    #multiply
    mult_l:
          mult $t0, $t1
          mflo $v0
          move $t3, $v0
          b done
#-----------------------
    #exit strategy
    done:
        #display the "result is" string
        la $a0, result
        li $v0, 4
        syscall
        #report the integer return value
        move $a0, $t3
        li $v0, 1 #1 is syscall for printing an integer
        syscall
        li $v0, 10 # 10 is the exit syscall.
        syscall # do the syscall.

# Data for the program:
.data
    instructions: .asciiz "Calculator program: Supported Ops: 0-add, 1-subtract, 2-multiply \n"
    num_1: .asciiz "Enter first value: \n"
    num_2: .asciiz "Enter second value: \n"
    op_value: .asciiz "Enter operation type \n"
    result: .asciiz "The result is: \n"
