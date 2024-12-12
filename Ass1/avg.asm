.data
    message: .asciiz "The average is: "
    array: .word 8, 2, 6, 4, 8, 10, 12, 14, 9, 15
    size: .word 10
.text
    # Initialize variables
    la $t1, array           # Address of the first element in the array
    li $t2, 0               # Index initialized to 0
    lw $t3, size            # Load size of the array (10)
    li $t4, 0               # Initialize integer sum to 0

lp:
    # Loop to sum the elements
    lw $t5, 0($t1)          # Load current element into $t5
    add $t4, $t4, $t5       # Add current element to sum
    addi $t1, $t1, 4        # Move to the next element (int = 4 bytes)
    addi $t2, $t2, 1        # Increment index
    bne $t2, $t3, lp        # If index != size, repeat loop

    # Calculate average
    mtc1 $t4, $f0           # Move integer sum to $f0 (convert to floating point)
    cvt.s.w $f0, $f0        # Convert integer sum to single-precision float
    mtc1 $t3, $f4           # Move size to $f4 (convert to floating point)
    cvt.s.w $f4, $f4        # Convert integer size to single-precision float
    div.s $f6, $f0, $f4     # Compute average (sum / size)

    # Print message
    li $v0, 4               # Syscall for printing a string
    la $a0, message         # Address of the message
    syscall

    # Print average
    li $v0, 2               # Syscall for printing a float
    mov.s $f12, $f6         # Move average to $f12 for printing
    syscall

    # Exit program
    li $v0, 10              # Syscall for exit
    syscall
