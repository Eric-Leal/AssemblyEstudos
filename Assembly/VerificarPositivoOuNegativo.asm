.data

msg1: .asciiz "Digite um numero: \n"
positivo: .asciiz "Numero é positivo"
negativo: .asciiz "Numero é negativo"
zero: .asciiz "é zero"

.text

# Mostrando mensagem para digitar número
li $v0, 4
la $a0, msg1
syscall

# Digitar o número
li $v0, 5
syscall
move $t0, $v0

# Verificando se o número é igual a zero
Zero:
bne $t0, $zero, FimZero # Se $t0 não for igual a zero, pula para 'FimZero'

	# Mostra a mensagem de que o número é zero
	li $v0, 4
	la $a0, zero
	syscall

	j Fim # Após mostrar a mensagem de que o número é zero, pula para 'Fim'
FimZero:

slt $t1, $t0, $zero # Verifica se $t0 é menor que zero, se sim, retorna 1, se não retorna 0

# Verificando se número é positivo/negativo
NumPositivo:
bne $t1, $zero, FimPositivo # Verifica se $t1 não é igual a zero, se for igual a zero, é positivo e continua, senão é negativo e pula para 'FimPositivo'

	# Mostra a mensagem de que o número é positivo
	li $v0, 4
	la $a0, positivo
	syscall

	j Fim # Após mostrar a mensagem de que é um número positivo, pula para 'Fim'

FimPositivo:

	# Mostra a mensagem de que o número é negativo
	li $v0, 4
	la $a0, negativo
	syscall

Fim:
