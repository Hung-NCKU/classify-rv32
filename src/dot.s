.globl dot

.text
# =======================================================
# FUNCTION: Strided Dot Product Calculator
#
# Calculates sum(arr0[i * stride0] * arr1[i * stride1])
# where i ranges from 0 to (element_count - 1)
#
# Args:
#   a0 (int *): Pointer to first input array
#   a1 (int *): Pointer to second input array
#   a2 (int):   Number of elements to process
#   a3 (int):   Skip distance in first array
#   a4 (int):   Skip distance in second array
#
# Returns:
#   a0 (int):   Resulting dot product value
#
# Preconditions:
#   - Element count must be positive (>= 1)
#   - Both strides must be positive (>= 1)
#
# Error Handling:
#   - Exits with code 36 if element count < 1
#   - Exits with code 37 if any stride < 1
# =======================================================
dot:
    li t0, 1
    blt a2, t0, set_error_36  
    blt a3, t0, set_error_37   
    blt a4, t0, set_error_37  

    li t0, 0   #total   
    li t1, 0   #t    

loop_start:
    bge t1, a2, loop_end
    # TODO: Add your own implementation
	
	#mul t2,t1,a3 #arr0
	mv t2,a3
	li t4, 0
	mv t6,t1
mul_loop:
    andi t3, t2, 1     # check the lsb of multiplier
    beqz t3, skip_add  # if lsb is 0 , skip_add
    add  t4, t4, t6    
skip_add:    
    slli t6, t6, 1     # Shift multiplicand left by 1 (multiply by 2 )
    srli t2, t2, 1     # Shift multiplier right by 1 (divide by 2 )
    bnez t2, mul_loop  # if t2 != 0 , mul_loop  
	mv t5,t4
	
	
	#mul t3,t1,a4 #arr1
	mv t2,a4
	li t4, 0   
	mv t6,t1       
mul_loop1:
    andi t3, t2, 1     # check the lsb of multiplier
    beqz t3, skip_add1  # if lsb is 0 , skip_add
    add  t4, t4, t6    
skip_add1:    
    slli t6, t6, 1     # Shift multiplicand left by 1 (multiply by 2 )
    srli t2, t2, 1     # Shift multiplier right by 1 (divide by 2 )
    bnez t2, mul_loop1  # if t2 != 0 , mul_loop  
	mv t3,t4
	mv t2,t5
	
	
	slli t2,t2,2 #*byte
	slli t3,t3,2 #*byte
	add t4,t2,a0 #add address
	add t5,t3,a1 #add address
    lw t2,0(t4) #load arr[i]
    lw t3,0(t5) #load arr[j]
    mul t2,t2,t3 #mul
    add t0,t0,t2 #total+=mul
	addi t1,t1,1 #t++
	j loop_start

loop_end:
    mv a0, t0
    jr ra

set_error_36:
    li a0, 36
    j exit
	
set_error_37:
    li a0, 37
    j exit
	