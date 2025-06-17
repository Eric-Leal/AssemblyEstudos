.data

    msg1: .asciiz "Digite o primeiro numero "
    msg2: .asciiz "Digite o segundo numero "
    msgResultado: .asciiz "O resultado e: "
    msgEscolha: .asciiz "Escolha o que deseja fazer:"
    msgOpcoes: .asciiz "1 - soma | 2 - subtracao | 3 - multiplicacao | 4 - divisao"

.text

_start:
    jal main


soma:
    add $v0, $a0, $a1
    jr $ra

subtracao:
    sub $v0, $a0, $a1
    jr $ra

multiplicacao:
    mul $v0, $a0, $a1
    jr $ra

divisao:
    div $a0, $a1
    mflo $v0
    jr $ra

main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t2, $v0
    
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    li $v0, 4
    la $a0, msgEscolha
    syscall

    li $v0, 4
    la $a0, msgOpcoes
    syscall

    li $v0, 5
    syscall
    move $t0, $v0


    beq $t0, 1, somaMain
    beq $t0, 2, subtracacaoMain
    beq $t0, 3, multiplicacaoMain
    beq $t0, 4, divisaoMain
    j fim

somaMain:
    move $a0, $t2
    move $a1, $t3
    jal soma
    move $t1, $v0
    j resultado

subtracacaoMain:
    move $a0, $t2
    move $a1, $t3
    jal subtracao
    move $t1, $v0
    j resultado

multiplicacaoMain:
    move $a0, $t2
    move $a1, $t3
    jal multiplicacao
    move $t1, $v0
    j resultado

divisaoMain:
    move $a0, $t2
    move $a1, $t3
    jal divisao
    move $t1, $v0
    j resultado

resultado:
    li $v0, 4
    la $a0, msgResultado
    syscall

    move $a0, $t1   # Move o resultado para $a0
    li $v0, 1
    syscall

    j fim

fim:
