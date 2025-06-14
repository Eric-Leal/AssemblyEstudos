.data

msg1: .asciiz "Escreva o primeiro número:\n"

msg2: .asciiz "Digite o segundo número:\n"

soma: .asciiz "O valor da soma é de: "

.text

#Mostrar a mensagem de digitar o primeiro numero
li $v0, 4 # O número 4 significa que imprime uma String //li signiifica Load Immediate
la $a0, msg1 # carrega o endereço da String // la significa Load Adress
syscall # Pedir apra sistema executar uma tarefa

# Digitando o primeiro numero
li $v0, 5 # O número 5 significa para ler Int
syscall # Pedir apra sistema executar uma tarefa
move $t0, $v0 #passar o valor digitado para a variavel

#Mostrar a mensagem de digitar o segundo numero
li $v0, 4 
la $a0, msg2
syscall

#Digitando o segundo numero
li $v0, 5
syscall
move $t1, $v0

#Fazendo a soma dos dois numeros
add $t2, $t0, $t1

#Mostrar mensagem de a soma é:
li $v0, 4 
la $a0, soma
syscall

#Imprimindo resultado da soma
li $v0, 1 #Imprimir um numero inteiro, o 1 significa print int
move $a0, $t2
syscall



