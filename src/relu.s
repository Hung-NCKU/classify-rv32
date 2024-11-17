.globl relu

.text
# ==============================================================================
# FUNCTION: Array ReLU Activation
#
# Applies ReLU (Rectified Linear Unit) operation in-place:
# For each element x in array: x = max(0, x)
#
# Arguments:
#   a0: Pointer to integer array to be modified
#   a1: Number of elements in array
#
# Returns:
#   None - Original array is modified directly
#
# Validation:
#   Requires non-empty array (length ≥ 1)
#   Terminates (code 36) if validation fails
#
# Example:
#   Input:  [-2, 0, 3, -1, 5]
#   Result: [ 0, 0, 3,  0, 5]
# ==============================================================================
relu:
    li t0, 1             
    blt a1, t0, error     #size<0,error
    li t1, 0             #position

loop_start:
    # TODO: Add your own implementation
	bge t1,a1,done
	slli t3,t1,2 #t3 = t1*4
	add t4,a0,t3
	lw t5,0(t4)
	blt t5,t0,set_zero
	j skip

set_zero:
	sw zero,0(t4)
	addi t1,t1,1 #t++
	j loop_start
	
skip:
	addi t1,t1,1 #t++
	j loop_start

done:
	ret

error:
    li a0, 36          
    j exit          
