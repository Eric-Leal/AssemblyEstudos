.data

    msg1: .asciiz "Digite o numero:"

    antecessor: .asciiz "\nO antecessor é:"
    sucessor: .asciiz "\nO sucessor é:"

.text

    #Faça um programa que receba um número inteiro e imprima na tela o seu antecessor e o seu sucessor.

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0
    
    mostrarNumeros:

        li $v0, 4
        la $a0, sucessor
        syscall

        add $t1, $t0, 1

        li $v0, 1
        move $a0, $t1
        syscall

        sub $t2, $t0, 1

        li $v0, 4
        la $a0, antecessor
        syscall

        li $v0, 1
        move $a0, $t2
        syscall




    
