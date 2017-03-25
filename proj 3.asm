#	1)	Create an array in memory that contains the following numbers:
#		1 – 2 – 5- 7- 10
#	2)	Write a program that iterate through the array and calculate the factorial
#	a.	Create a function that recursively calculates the factorial for that number.
#	3)	Analyze and describe the solution. 

.data
	array: .word 1, 2, 5, 7, 10		#values are automatically stored into memory
	answer: .word 0, 0, 0, 0, 0		#values are automatically stored into memory
.text
	main:
		la	$s0, array		#load values in array into $s0
		la	$s1, answer		#load values in answer into $s1
		li	$t3, 5			#to loop 5 times since there is 5 values in the array
	
	nextElement:
		lw	$a0, 0($s0)		#load the first value into the first element 
		jal	factorial		#jump to factorial
		sw	$v0, 0($s1)		#store result from factorialArithmetic into memory
		addi	$t3, $t3, -1		#decrement $t3
		addi	$s0, $s0, 4		#increment $s0 to the next element
		addi	$s1, $s1, 4		#increment $s1 to the next element
		bne	$t3, $zero, nextElement	#jump to nextElement if $t3 !=0
		j	done			#jumps to done to prevent the program from reading the factorial and factorialArithmetic section
		
	factorial:
		addi     $sp, $sp, -8             #push pointer 8 bytes back to adjust stack for 2 items
		sw       $ra, 4($sp)              #save the return address to the first 4 bytes
		sw       $a0, 0($sp)              #save the argument to the next 4 bytes
		slti     $t0, $a0, 1              #if value in $a0 < 1, set $t0 = 1
		beq      $t0, $zero, factorialArithmetic	#jump to factorialArithmetic if $t0 = 0
		addi     $v0, $zero, 1            #if $v0 = 0, set it to 1
		addi     $sp, $sp, 8              #pop 2 items from stack
		jr       $ra                      #return address
		
	factorialArithmetic:
		addi     $a0, $a0, -1             #decrement the value in $a0
		jal      factorial                #recursive call
		lw       $a0, 0($sp)              #restore previous value in $a0
		lw       $ra, 4($sp)              #restore previous value in return address
		addi     $sp, $sp, 8              #pop 2 items from stack
		mul      $v0, $a0, $v0            #multiply to get result
		jr       $ra                      #return address
	
	done: