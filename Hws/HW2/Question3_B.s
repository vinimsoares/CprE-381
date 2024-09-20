.data
str2: .asciiz ""
dest: .space 20 #allocate space for dest
.align 2
.text
.globl main
# Exit program
main:

    la $a0, dest # Load address of destination
    la $a1, str2 # Load address of source   
    # Call strcpy function
    jal strcpy 

    # Print the copied string
    li $v0, 4 # syscall for print string
    la $a0, dest # Load address of destination
    syscall


li $v0, 10
syscall


#function that imitates strcpy, each character is a byte long
strcpy:
    # $a0 = destination address
    # $a1 = source address
    # a function in MIPS can return up to two values stored prpeviosly in $v0 and $v1 before the jr $ra call.
LOOP:
    # Load byte from source
    lb $t0, 0($a1)
    # Check if src is null
    beq $t0,$zero, EXIT
    # Store byte  in dest
    sb $t0, 0($a0)
    # increment pointers
    addi $a0, $a0, 1
    addi $a1, $a1, 1
    # jump
    j LOOP

EXIT:
    # setting null terminator
    sb $zero, 0($a0)

    # Return the destination address
    move $v0, $a0
    jr $ra





