.data
.align 2
.text

.globl main
#THIS PROGRAM CONTAIN A FIBONNACI NUMBER FUNCTION
main:
#enter value to test fib
li $a0, 6
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

bgt $a0, 1, FOR_LOOP #if N <= 0 print
move $v0, $a0
jr $ra

FOR_LOOP: bge $s0, $a0, exit#if i == N exit
    move $t0,$s1#save n-1
    add $s1,$s1,$s2 # n = n-1 + n-2
    move $s2, $t0 #save the next n-2 with n-1 from this current call
    addi $s0,$s0,1 #increment loop
    j FOR_LOOP# loop back

exit:
    move $a0,$s2#save n to argument
    move $v0, $a0 #save the return value to $v0
    jr $ra # return
