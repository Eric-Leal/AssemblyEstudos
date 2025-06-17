.data

num1: .asciiz "Digite o primeiro numero:"
num2: .asciiz "Digite o segundo numero:"
msgMaior: .asciiz " é maior"

.text

#Mostrar mensagem de digitar o primeiro numero
li $v0, 4
la $a0, num1
syscall

#Escrever o primeiro numero
li $v0, 5
syscall
move $t0, $v0

#Mostrar mensagem de digitar o segundo numero
li $v0, 4
la $a0, num2
syscall

#Digitar o segundo numero
li $v0, 5
syscall
move $t1, $v0

slt $t2, $t0, $t1 #verifica se t0 é menor que t1, se sim retorna 1 se nao retorna 0


menor:
bne $t2, $zero, maior #Se t2 não for igual a zero pula para a linha maior, se for igual ele prossegue.

    #imprime o primeiro numero digitado
    li $v0, 1
    move $a0, $t0
    syscall

    #mostra a mensagem de qual numero é maior
    li $v0, 4
    la $a0, msgMaior
    syscall
    j fim #pula para o final apos mostrar a mensagem de que o numero é maior

maior:

    #imprime o segundo numero digitado
    li $v0, 1
    move $a0, $t1
    syscall

    #mostra a mensagem de qual numero é maior
    li $v0, 4
    la $a0, msgMaior
    syscall

fim:






