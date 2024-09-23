.data

.align 2


.text
.globl main

main:

    lw $a0, 0($s0)
    lw $a1, 0($s1)

    jal swap

    li $v0, 1
    lw $a0, 0($s0)
    syscall

li $v0, 10
syscall


swap:
    #$a0 = first argument
    #$a1 = second argument

    lw $t0, 0($a0)#load first value
    lw $t1, 0($a1)#load second value

    sw $t1, 0($a0) #save second value in first argument
    sw $t0, 0($a1) #save first value in second argument

    jr $ra

