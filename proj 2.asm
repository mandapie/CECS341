#(b)	Change the previous program, so instead of just printing the number,
#		it should store it into memory.
#		(Be aware of addressing every integer will take 4 bytes.)
.data
	number: .word
.text
	la $t0, number
	li $s0, 2	
	while:
		sw $s0, 0($t0)
		addi $s0, $s0, 2
		addi $t0, $t0, 4
		ble $s0, 10, while