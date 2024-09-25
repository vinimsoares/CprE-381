.data
.align 2
.text

.globl main
#THIS PROGRAM CONTAIN A FIBONNACI NUMBER FUNCTION
main:
li $a0, 5
jal fibonacci

li $v0, 1
syscall






li $v0, 10
syscall



fibonacci:
#$a0 = N
#using $s0 as the index for the for loop Starting at 1
addi $s0, $zero, 1
#using $s1 as the n-1 value
addi $s1, $zero,   1		# $s1 = zero + 1
#using $s2 as the n-2 value
addi	$s2,  $zero, 0
FOR_LOOP: bge $s0, $a0, exit
    move $t0,$s1
    add $s1,$s1,$s2
    move $s2, $t0
    addi $s0,$s0,1 #increment loop
    j FOR_LOOP

exit:
    move $a0,$s1
    move $v0, $a0
    jr $ra
