.data

pularLinha: .asciiz "\n"

.text
li $t0, 0 #valor inicial
li $t1, 0 #valor do i
li $t2, 50 #tamanho do for

for:
beq $t1, $t2,endFor

	addi $t0, $t0, 10
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, pularLinha
	syscall
				
	addi $t1, $t1, 1
	j for
	
endFor:

syscall