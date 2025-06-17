.data

    msg1: .asciiz "Digite o primeiro numero"
    msg2: .asciiz "Digite o segundo numero"
    msgMenor: .asciiz " é menor"

.text

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

slt $t2, $t0, $t1 

bne $t2, 1, menor

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msgMenor
    syscall

    j fim

menor:

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, msgMenor
    syscall

fim:




