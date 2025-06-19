.data

    msg1: .asciiz "Digite o primeiro numero "
    msg2: .asciiz "Digite o segundo numero "
    msgResultado: .asciiz "O resultado e: "
    msgEscolha: .asciiz "Escolha o que deseja fazer:\n"
    msgOpcoes: .asciiz "1 - soma \n2 - subtracao \n3 - multiplicacao \n4 - divisao"

.text

_start:
    jal main #Por conta das funções precisa ter isso aqui para ele entender por onde o codigo começa


soma:
    add $v0, $a0, $a1 #Faz as somas com os valores passados através main
    jr $ra #'Retorna os valores para a main'

subtracao:
    sub $v0, $a0, $a1 #Faz a subtracao com os valores passados através main
    jr $ra #'Retorna os valores para a main'

multiplicacao:
    mul $v0, $a0, $a1 #Faz multiplicacao com os valores passados através main
    jr $ra #'Retorna os valores para a main'

divisao:
    div $a0, $a1 #Divide os dois valores passados através da main
    mflo $v0 #Armazena o resultado aqui
    jr $ra #'Retorna os valores para a main'

main:
    #Comando para mostrar a mensagem de digitar o primeiro numero
    li $v0, 4
    la $a0, msg1
    syscall

    #Comando para digitar o primeiro numero
    li $v0, 5
    syscall
    move $t2, $v0
    
    #Comando para mostrar a mensagem de digitar o primeiro numero
    li $v0, 4
    la $a0, msg2
    syscall

    #Comando para digitar o segundo numero
    li $v0, 5
    syscall
    move $t3, $v0

escolherOpcao:

    # Mostrar mensagem sobre o que deseja fazer
    li $v0, 4
    la $a0, msgEscolha
    syscall

    # Mostrar as opcoes disponiveis da calculadora
    li $v0, 4
    la $a0, msgOpcoes
    syscall

    # Codigo para escolher o que deseja fazer 
    li $v0, 5
    syscall
    move $t0, $v0

    #Apenas armazenando 1 e 5 para poder usar no slt das proximas linhas
    li $t5, 1 
    li $t6, 5 

    # Verifica se a opcao e menor que 1, se for menor que 1 volta pro 'Escolher opcao' para colocar valor valido
    slt $t4, $t0, $t5 #Para nao ter que usar o registrador $t5, poderia ser feito 'slti, $st4, $t0, 1' || slti permite colocar o numero sem ser por registrador
    bne $t4, $zero, escolherOpcao

    # Verifica se a opcao e menor que 4, se for menor que 1 volta pro 'Escolher opcao' para colocar valor valido
    slt $t4, $t0, $t6
    beq $t4, $zero, escolherOpcao

    #Compara se o valor passado é igual a algum desses
    beq $t0, 1, somaMain #Se for igual a 1 vai para 'somaMain'
    beq $t0, 2, subtracacaoMain #Se for igual a 2 vai para 'subtracaoMain'
    beq $t0, 3, multiplicacaoMain #Se for igual a 3 vai para 'multiplicacaoMain'
    beq $t0, 4, divisaoMain #Se for igual a 4 vai para 'divisaoMain'


somaMain:
    #Passa os valores digitados para o valor  1 e 2 para #a0 e #a1 respectivamente
    move $a0, $t2
    move $a1, $t3
    jal soma #jal = jump and link, faz o 'jump' para a função de soma
    move $t1, $v0 #Passa o resultado obtido na funcao para $t1
    j resultado #Pula para linha 'resultado'

subtracacaoMain:
    #Passa os valores digitados para o valor  1 e 2 para #a0 e #a1 respectivamente
    move $a0, $t2
    move $a1, $t3

    jal subtracao # jal = jump and link, faz o 'jump' para a função de subtracao
    move $t1, $v0 #Passa o resultado obtido na funcao para $t1
    j resultado #Pula para linha 'resultado'

multiplicacaoMain:
    #Passa os valores digitados para o valor  1 e 2 para #a0 e #a1 respectivamente
    move $a0, $t2
    move $a1, $t3
    jal multiplicacao # jal = jump and link, faz o 'jump' para a função de multiplicacao
    move $t1, $v0 #Passa o resultado obtido na funcao para $t1
    j resultado #Pula para linha 'resultado'

divisaoMain:
    #Passa os valores digitados para o valor  1 e 2 para #a0 e #a1 respectivamente
    move $a0, $t2
    move $a1, $t3
    jal divisao # jal = jump and link, faz o 'jump' para a função de divisao
    move $t1, $v0 #Passa o resultado obtido na funcao para $t1
    j resultado #Pula para linha 'resultado'

resultado:
    #Comando para mostrar mensagem 'O resultado e:'
    li $v0, 4
    la $a0, msgResultado
    syscall

    li $v0, 1 #Imprime o resultado
    move $a0, $t1   # Move o resultado para $a0
    syscall

    j fim

fim:
