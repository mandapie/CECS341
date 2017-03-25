#understand the code

.data
#A and B are 4-byte arrays
	A: .word 1,3,5,7	#A[4] = 1,3,5,7
	B: .word 2,4,6,8	#B[4] = 2,4,6,8
.text
	#Set array A into address s6
	la	$s6, A		#$s6 = A[]
	#Set array B into address s7	
	la	$s7, B		#$s7 = B[]
	#shift left logically by 1 bit in MIPS means multiply by 2 in C. Since .word is 4 bytes, we have to shift left twice. f is the base address for array A in C
	sll	$t0, $s0, 2 	#$t0 = f * 4
	#Store $s6 (which contains array A) into $t0
	add 	$t0, $s6, $t0 	#$t0 = &A[f]
	#shift left logically by 1 bit in MIPS means multiply by 2 in C. Since .word is 4 bytes, we have to shift left twice. g is the base address for array B in C
	sll	$t1, $s1, 2 	#t1 = g * 4
	#Store $s7 (which contains array B) into $t1
	add 	$t1, $s7, $t1 	#t1 = &B[g]
	#Load .word from memory starting from the 1st element array A
	lw	$s0, 0($t0) 	#f = A[f]
	#Increment to the next index in the array
	addi $t2, $t0, 4	#$t2 = &A[f] + 4
	#Load .word from memory starting from the 2nd item of array A
	lw	$t0, 0($t2)	#$t0 = A[f + 1]
	#Add 1st element of A and 2nd element of A, which is 1 + 3
	add 	$t0, $t0, $s0	#$t0 = A[f] + A[f + 1]
	#Store the result of $t0 into the 1st index of array B
	sw	$t0, 0($t1)	#B[g] = A[f] + A[f + 1]