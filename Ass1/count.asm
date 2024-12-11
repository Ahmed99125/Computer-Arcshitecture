.data
    message: .asciiz "Count of even numbers is: "
    array:  .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4

.text
	la   $t0, array           # array
        li   $t1, 10              # array size
        li   $t2, 0               # even count
        li   $t3, 0               # index

    lp:
	bge  $t3, $t1, end    # if index >= array size

        lw   $t4, 0($t0)          # load the element into $t4
        andi $t5, $t4, 1          # check if even (AND with 1)

        beq  $t5, $zero, incCnt    # if is even

    incElement:
        addi $t3, $t3, 1          # increment index
        addi $t0, $t0, 4          # move to next element
        j lp                    # return to the lp

    incCnt:
        addi $t2, $t2, 1          # increment counter
        j incElement             # return to the lp

    end:
        li $v0, 4
        la $a0, message           # print message
        syscall
        
        li $v0, 1
        move $a0, $t2             # print count
        syscall

        li $v0, 10              # exit program
        syscall
