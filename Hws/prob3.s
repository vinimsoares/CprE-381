.data
str1: .asciiz "Please enter a number:\n"
.align 2
vals: .word 25 1 4 10 381 42 100 60 0 12
.text
.globl main

main:
# Start program
addi $s1, $zero, 0 # s1 is ouput value
inputs:
# Request some user input:

addi $s2, $zero, 1
LOOP: bgt $s2, $s3, EXIT
lw $t1, $s2($s5)

sll $t0, $t1, 3
sw $s2($s4),$t0
addi $s2, $s2, 1
j LOOP
EXIT:

#addu $s1, $s0, $s1

# Print output
#li $v0, 1
#addi $a0, $s1, 0
#syscall
# Exit program
li $v0, 10
syscall

