.data

.text

# X = 5;
# Y = X % 2;
# W=Y/4
# Z=W*Y

    
    li $t0, 5 # X = 5
    li $t1, 2
    div $t0, $t1  
    mfhi, $t2 # Y = X%2 = 1 || Resto da divisão entre 5 e 2 = 1  
    li $t3, 4
    div $t2, $t3
    mflo $t4 # W = Y/4 || Armazena resultadado da divisão entre Y e 4, $t2/$t3
    mult $t4, $t2
    mflo $t5 # Z = W*Y || Armazena resultado da multiplicação de W*Y, $t4*$t2


    #Mostra resultado final, vai dar zero pq tem um momento que ele divide 1 por 4
    li $v0, 1
    move $a0, $t5
    syscall