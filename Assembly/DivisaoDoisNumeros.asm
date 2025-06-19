.data 

    msg1: .asciiz "Digite o primeiro numero"
    msg2: .asciiz "Digite o segundo numero"
    msgDiv: .asciiz "A divisão é:"

.text

    #Mostrar mensagem de digitar o primeiro numero   
    li $v0, 4
    la $a0, msg1
    syscall

    #Comando para digitar o primeiro numero
    li $v0, 5
    syscall
    move $t0, $v0

    #Mostrar mensagem de digitar o segundo numero
    li $v0, 4
    la $a0, msg2
    syscall

    #Comando para digitar o segundo numero
    li $v0, 5
    syscall
    move $t1, $v0

    #Dividir um numero pelo outro
    div	$t2, $t0, $t1

    #OU
    #div $t0, $t1
    #mflo $t2 #armazenar resultado da divisao na $t2
    
    #Mostrar a mensagem de A divisao é
    li $v0, 4
    la $a0, msgDiv
    syscall

    #Mostrar resultado da divisao
    li $v0, 1
    move $a0, $t2
    syscall