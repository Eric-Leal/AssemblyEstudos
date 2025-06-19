.data

msg1: .asciiz "Digite o primeiro numero:\n"
msg2: .asciiz "Digite o segundo numero:\n"
subtracacao: .asciiz "Resultado da subtracao eh de: "

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

#Mensagem de digitar o segundo numero
li $v0, 5
syscall
move $t1, $v0

#subtrair os numeros 
sub $t3, $t0,$t1

#Mensagem de a subtracao eh:
li $v0, 4
la $a0, subtracacao
syscall

#Mostrar a subtracao
li $v0, 1 # aqui eh o que quer imprimir, e o tipo do que quer imprimir, 1 significa imprimir inteiro
move $a0, $t3 # basicamente esta dizendo, imprima $t3
syscall

