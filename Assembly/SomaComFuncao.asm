.data 

.text
.globl main

_start:         
    jal main    #Chama a função main, necessário para iniciar corretamente o programa

soma:
    add $v0, $a0, $a1 #Soma os valores dos registradores $a0 e $a1, resultado em $v0
    jr $ra            #Retorna para a instrução seguinte à chamada da função

main:
    li $a0, 5         #Carrega o valor 5 no registrador $a0 (primeiro argumento)
    li $a1, 3         #Carrega o valor 3 no registrador $a1 (segundo argumento)
    jal soma          #Chama a função soma

    move $a0, $v0     #Move o resultado da soma ($v0) para $a0, que será impresso
    li $v0, 1         #Carrega o código do serviço para imprimir inteiro em $v0
    syscall           #Chama o serviço do sistema para imprimir o valor em $a0