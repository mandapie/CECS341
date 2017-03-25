#loop data into memory

.data
	number: .word
.text
	la $t0, number		#load the address of "number" into $t0
	li $s0, 2			#set $s0 with value 2
						#or addi $s0, $s0, 2
	
	while:
		sw $s0, 0($t0)		#store the value in $t0 into $s0
		addi $s0, $s0, 2	#$t0 = St0 + 2	
		addi $t0, $t0, 4	#increment to the next register
		ble $s0, 10, while	#if $t0 <= 10, jump to "while"