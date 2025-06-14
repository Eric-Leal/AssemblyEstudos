.data

msg1: .asciiz "Digite o primeiro numero:\n"
msg2: .asciiz "Digite o segundo numero:\n"
subtracacao: .asciiz "Resultado da subtração é de: "

.text

#Mensagem de ler o primeiro numero
li $v0, 4
la $a0, msg1
syscall

#Digitar o primeiro numero
li $v0, 5
syscall
move $t0, $v0

#Mensagem de ler o segundo numero
li $v0, 4
la $a0, msg2
syscall

#Mensagemde digitar o segundo numero
li $v0, 5
syscall
move $t1, $v0

#subtrair os numeros 
sub $t3, $t0,$t1

#Mensagem de a subtração é:
li $v0, 4
la $a0, subtracacao
syscall

#Mostrar a subtração
li $v0, 1 # aqui é o que quer imprimir, e o tipo do que quer imprimir
move $a0, $t3 # basicamente esta dizendo, imprima isso
syscall

