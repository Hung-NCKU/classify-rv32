.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error #a1= size

    lw t0, 0(a0) # t0 = a[0]
    li t2, 0 #t2 = t = 0
	li t1, 0 #max
	
loop:
	bge t6, a1, end  
    # TODO: Add your own implementation
	bge t2,a1,end
	slli t3,t2,2
	add t3,a0,t3
	lw t4,0(t3)
	ble t4,t0,skip
	mv t0,t4
	mv t1,t2


	
skip:
    addi t2, t2, 1   
    j loop
    
end:
    mv a0,t1
    ret    

handle_error:
    li a0, 36
    j exit
