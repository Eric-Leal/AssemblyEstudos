.data

    msg1: .asciiz "Escreva a nota do aluno "
    msg2: .asciiz "A media dos alunos e de: "
    pularLinha: .asciiz "\n"

.text
    #Faça um programa que leia 4 notas de 1 aluno, calcule e mostre na tela a soma e a média aritmética das notas.

    # os registradores $s são os que não são temporarios, funcionam igual o $t mas com essa diferença
    li $s0, 1
    li $s1, 5 # tamanho do for, numero de alunos + 1, Coloquei assim pq o i começa com 1 e não com zero
    li $s2, 0
    li $s3, 4 # quantidade de alunos

    loop:

        beq $s0, $s1, endLoop

        #Mostrar mensagem, digite a nota do aluno
        li $v0, 4
        la $a0, msg1
        syscall

        #Mostra qual aluno é
        li $v0, 1
        move $a0, $s0
        syscall

        #pula linha 
        li $v0, 4
        la $a0, pularLinha
        syscall

        #Comando para dizer quanto aluno tirou
        li $v0, 5
        syscall
        move $t0, $v0 #

        add $s2, $s2, $t0 # $s2 += $t1

        add $s0, $s0, 1 #i++

        j loop

    endLoop:

        div $s2, $s3
        mflo $t1

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $t1
        syscall