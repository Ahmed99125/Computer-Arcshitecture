.data
	message: .asciiz "The minimum number is: "
	array: .word 5, 10, 24, 28, 19, 23, 1, 9, 34, 23
.text
	li $t0, 0	#index
	la $t1, array	#current element (starts from first element in array)
	lw $t2, 0($t1)	#minimum element
	li $t3, 10	#size
	
	check:
		bge $t0, $t3, end	#if index >= size end
		lw $t4, 0($t1)		#load current element
		blt $t4, $t2, update	#if current element < current min update
	nextElement:
		addi $t0, $t0, 1	#increment index
		addi $t1, $t1, 4	#next element
		j check
	update:
		lw $t2, 0($t1)	#current element is the new minimum
		j nextElement
	end:
		li $v0, 4
        	la $a0, message           # print message
	        syscall
        
	        li $v0, 1
	        move $a0, $t2             # print count
	        syscall
	        
	        li   $v0, 10              # exit program
        	syscall