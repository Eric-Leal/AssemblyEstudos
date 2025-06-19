.data

msg1: .asciiz "Digite o primeiro numero"
msg2: .asciiz "Digite o segundo numero"
msgMenor: .asciiz " eh menor"

.text

# Mostrar mensagem de digitar o primeiro numero
li $v0, 4
la $a0, msg1
syscall

# Ler o primeiro numero digitado
li $v0, 5
syscall
move $t0, $v0

# Mostrar mensagem de digitar o segundo numero
li $v0, 4
la $a0, msg2
syscall

# Ler o segundo numero digitado
li $v0, 5
syscall
move $t1, $v0

# Verifica se t0 eh menor que t1, se sim retorna 1 em t2, senão retorna 0
slt $t2, $t0, $t1

# Se t2 for diferente de zero, vai para o label primeiroMenor
bne $t2, $zero, primeiroMenor

    # Imprime o segundo numero digitado (t1)
    li $v0, 1
    move $a0, $t1
    syscall

    # Mostra a mensagem de que o numero eh menor
    li $v0, 4
    la $a0, msgMenor
    syscall

    j fim # Pula para o final após mostrar a mensagem

primeiroMenor:

    # Imprime o primeiro numero digitado (t0)
    li $v0, 1
    move $a0, $t0
    syscall

    # Mostra a mensagem de que o numero eh menor
    li $v0, 4
    la $a0,