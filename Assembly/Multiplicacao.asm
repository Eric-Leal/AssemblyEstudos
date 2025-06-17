.data

    msg1: .asciiz "Digite o primeiro numero:"
    msg2: .asciiz "Digite o segundo numero:"
    multiplicacao: .asciiz "O valor da multiplicacao é de :"

.text
#Mostrar mensagem de digitar primeiro numero
li $v0, 4
la $a0, msg1
syscall

#Comando para  digitar primeiro numero
li $v0, 5
syscall
move $t0, $v0

#Mostrar mensagem de digitar segundo numero
li $v0, 4
la $a0, msg2
syscall

#Comando para mostrar segundo numero
li $v0, 5
syscall
move $t1, $v0

#Comando para fazer a multiplicação
#Pode ser feito assim
mul $t2, $t0, $t1
#Ou assim, com os numero que vao ser multiplicados no mult e o armazenamento na mflo
# mult   $t0, $t1
# mflo   $t2

#Mostrar mensagem de a multiplicação é:
li $v0, 4
la $a0, multiplicacao
syscall

#Imprimir a multiplicação na tela
li $v0, 1
move $a0, $t2
syscall
