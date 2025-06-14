.data

msg1: .asciiz "Digite um numero: \n"
positivo: .asciiz "Numero é positivo"
negativo: .asciiz "Numero é negativo"
zero: .asciiz "É zero"

.text

#Mostrando mensagem de imprimir numero
li $v0, 4
la $a0, msg1
syscall

#Digitar o numero
li $v0, 5
syscall
move $t0, $v0

#Verificando se o numero é igual a zero
Zero:
bne $t0, $zero, FimZero #Se $t0 não for igual a zero, ele pula para a linha 'FimZero:'

	#Mostra a mensagem de que o numero é zero
	li $v0, 4
	la $a0, zero
	syscall
	
	j Fim #Após mostrar a mensagem de que o numero é zero, ele pula para a linha 'Fim'
FimZero:

slt $t1, $t0, $zero #Verifica se $t0 é menor que zero, se sim, retorna 1, se não retorna 0

#Verificando se numero é positivo/negativo
NumPositivo:
bne $t1, $zero, FimPositivo #Verfica se $t1 não é igual a zero, se for igual a zero, ele é positivo e 
#continua na linha de baixo, se não for, ele é igual a 1, ou seja, é negativo e pula para a linha FimPositivo
	
	#Mostra a mensagem de que o numero é postivo
	li $v0, 4
	la $a0, positivo
	syscall
	
	j Fim #Após mostrar a mensagem de que é um numero postivo, ele pula para o Fim
	
FimPositivo:

	#Mostra a mensagem de que o numero é negativo
	li $v0, 4
	la $a0, negativo
	syscall
	
Fim:

