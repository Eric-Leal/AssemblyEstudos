.data

msg1: .asciiz "Digite um numero: \n"
positivo: .asciiz "Numero � positivo"
negativo: .asciiz "Numero � negativo"
zero: .asciiz "� zero"

.text

#Mostrando mensagem de imprimir numero
li $v0, 4
la $a0, msg1
syscall

#Digitar o numero
li $v0, 5
syscall
move $t0, $v0

#Verificando se o numero � igual a zero
Zero:
bne $t0, $zero, FimZero #Se $t0 n�o for igual a zero, ele pula para a linha 'FimZero:'

	#Mostra a mensagem de que o numero � zero
	li $v0, 4
	la $a0, zero
	syscall
	
	j Fim #Ap�s mostrar a mensagem de que o numero � zero, ele pula para a linha 'Fim'
FimZero:

slt $t1, $t0, $zero #Verifica se $t0 � menor que zero, se sim, retorna 1, se n�o retorna 0

#Verificando se numero � positivo/negativo
NumPositivo:
bne $t1, $zero, FimPositivo #Verfica se $t1 n�o � igual a zero, se for igual a zero, ele � positivo e 
#continua na linha de baixo, se n�o for, ele � igual a 1, ou seja, � negativo e pula para a linha FimPositivo
	
	#Mostra a mensagem de que o numero � postivo
	li $v0, 4
	la $a0, positivo
	syscall
	
	j Fim #Ap�s mostrar a mensagem de que � um numero postivo, ele pula para o Fim
	
FimPositivo:

	#Mostra a mensagem de que o numero � negativo
	li $v0, 4
	la $a0, negativo
	syscall
	
Fim:

