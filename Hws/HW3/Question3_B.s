.data
.align 2
.text
.globl main

main:
li $a0, 6
jal fibonacci

addi		$v0, $0, 1		# system call #1 - print int
syscall						# execute


addi	$v0, $0, 10		# System call 10 - Exit
syscall					# execute



fibonacci: 
#$a0 is the N

#if N<= 1 return
bgt $a0, 1,LOOP
move $v0, $a0
jr $ra

LOOP:
    #open space on stack to save some values
    sub $sp, $sp, 12
    sw $a0, 0($sp)
    sw $ra, 4($sp)#save the return address
    #return fibonacci(n-1)
    addi $a0, $a0, -1
    jal fibonacci
    #save the result from this call
    sw $v0, 8($sp)

    lw $t0, 0($sp)
    #return fibonacci(n-2)
    addi $a0, $t0, -2
    jal fibonacci

    lw $t0, 8($sp)
    add $v0, $v0, $t0
    lw $ra, 4($sp)
     addi $sp, $sp, 12
    move $a0, $v0

    jr $ra
