.data
str2: .asciiz "Vinicius"
.align 2
.text
.globl main

main:
# Start program
addi $s1, $zero, 0 # s1 is the dest
addi $s0, $zero, 0 # s0 is the index

Loop: bge $s0, $a1, Exit # if index is greater than the number of characters, exit
sll $t0, $s0, 2 # multiply index by 4 to get the offset
lw $t1, $t0($a0) # load the character from the base address + offset
sw $t1, $t0($s1) # store the character in the dest
addi $s0, $s0, 1 # increment index
j Loop # repeat
Exit:




# Exit program
li $v0, 10
syscall
