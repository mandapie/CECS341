#(a)	Convert the following into code that uses a while loop.
#		prints 2
#		prints 4
#		prints 6
#		prints 8
#		prints 10
#		prints Goodbye!

.data
	message: .asciiz "Goodbye!"
	newLine: .asciiz "\n"
.text
	main:
		addi $t0, $zero, 2		#$t0 = 0 + 2
		
		while:
			bgt $t0, 10, exit	#if $t0 >= 10, jump to "exit". bgt = branch greater than
			jal printNumber		#jump to "printNumber"
			addi $t0, $t0, 2	#$t0 = St0 + 2
			j while			#jump to "while" unconditionally
			
		printNumber:
			li $v0, 1		#load immediate value into $v0
						#we are telling the system that we are prepping to print something out
						#1 = a number, 4 a string (number of registers needed)
			add $a0, $t0, $zero	#add the value from $t0 to $a0
			syscall			#print the number
			
			li $v0, 4		#load immediate value into $v0
			la $a0, newLine		#load newLine into $a0
			syscall			#print newLine
			
			jr $ra			#returns to the address stored in $ra (stored by jal instruction)
		exit:
			li $v0, 4		#load immediate value into $v0
			la $a0, message		#load message into $a0
			syscall			#print message
