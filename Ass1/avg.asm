.data
    message: .asciiz "The average is: "
    array: .float 8.0, 2.0, 6.0, 4.0, 8.0, 10.0, 12.0, 14.0, 9.0, 15.0
    size: .word 10
.text
    # Initialize variables
    la $t1, array           # Address of the first element in the array
    li $t2, 0               # Index initialized to 0
    lw $t3, size            # Load size of the array (10)
    
    mtc1 $zero, $f0         # Initialize floating-point sum to 0.0
    
lp:
    # Loop to sum the elements
    l.s $f2, 0($t1)         # Load current element into $f2
    add.s $f0, $f0, $f2     # Add current element to sum
    addi $t1, $t1, 4        # Move to the next element (float = 4 bytes)
    addi $t2, $t2, 1        # Increment index
    bne $t2, $t3, lp        # If index != size, repeat loop

    # Calculate average
    mtc1 $t3, $f4           # Move size to $f4 (convert to floating point)
    cvt.s.w $f4, $f4        # Convert integer in $f4 to single-precision float
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
