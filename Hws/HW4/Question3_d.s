.data
array: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.align 2
.text
.globl main

main:

addi $a0,$0,10
addi $a1,$0,1
jal code





addi $v0,$0,10
syscall


code:

move $s0,$a0
move $s1,$a1

la $s2,array
#started counting here
addi $t0, $0, 0
j Test1
Loop1: addi $t1, $0, 0
beq $0,$0,Test2
Loop2: add $t3,$t0,$t1
sll $t2,$t1,2
add $t2,$t2,$s2
sh $t3,0($t2)
addi $t1,$t1,4
Test2: slt $t2,$t1,$s1
bne $t2,$0,Loop2
addi $t0,$t0,2
Test1: slt $t2,$t0,$s0
bne $t2,$0,Loop1
#stop counting here

jr $ra
