.data

pularLinha: .asciiz "\n"

.text
li $t0, 0 #Valor inicial
li $t1, 0 #Valor do i || $t1 vai ser o equivalente ao i dentro de um for 'for(int i = 0; ...)'
li $t2, 50 #Tamanho do for

for:
beq $t1, $t2,endFor #se $t1 for igual a $t2 pula para linha endFor, basicamente se 'i < 50'

	addi $t0, $t0, 10 #adiciona 10 para $t0
	
	#Comando para mostrar os numeros dentro do for
	li $v0, 1
	move $a0, $t0
	syscall
	
	#Comando que roda a msg pularLinha, usando somente para melhorar a visualizacao
	li $v0, 4
	la $a0, pularLinha
	syscall

				
	addi $t1, $t1, 1 #Adiciona +1 para o i || Equivale ao i++ do for
	j for #Pula para o inicio do for para continuar a repetição
	
endFor:

syscall