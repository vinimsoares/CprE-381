.data
str1: .asciiz "E"
str2: .asciiz "V"
str3: .asciiz "G"
str4: .asciiz "S"
str5: .asciiz "N"
.align 2

.text
.globl main

main:
# Start program
addi $s1, $zero, 0 # s1 is ouput value
inputs:
# Request some user input:

blt $a0, 95, L2
la $v0, str1
j EXIT
L2: blt $a0, 85, L3
la $v0, str2
j EXIT
L3: blt $a0, 75, L4
la $v0, str3
j EXIT
L4: blt $a0, 65, L5
la $v0, str4
j EXIT
L5:la $v0, str5

EXIT:





#addu $s1, $s0, $s1


# Exit program
li $v0, 10
syscall

