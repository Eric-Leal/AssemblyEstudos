.data

.text

    # A = 0;
    # B = 20;
    # do {
    # A = A+1;
    # } while (A < B);
    #Esse comando em C mostrar numeros de 1 a 20


    li $t0, 0
    li $t1, 20

    loop:

        add $t0, $t0, 1 #Como é um do while ele deve fazer a adição primeiro
        slt $t2, $t0, $t1 # se $t0 for menor que $t1, $t2 recebe 1
        #Comando apenas para mostrar os numeros
        li $v0, 1
        move $a0, $t0
        syscall
        beq $t2, 1, loop # enquanto $t2 for igual a 1 ele executa e pula para linha 'loop:' || Desvia se for igual, enquanto o numero for igual ele faz o desvio, quando não for igual ele continua para as linhas de baixo

    endloop:
