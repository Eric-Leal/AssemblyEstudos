.data
B:      .space 400         # Espaço para 100 inteiros (100 × 4 bytes)

.text

main:
    li $t0, 20          # A = 20
    li $t1, 0           # i = 0
    la $s0, B           # endereço base do vetor B

loop:
    # if i >= 100 → equivale a !(i < 100)
    li $t7, 100
    slt $t8, $t1, $t7       # $t8 = 1 se $t1 < 100
    beq $t8, $zero, endloop # se $t1 >= 100, sai do loop

    # if (A > 30) → equivale a (30 < A) → slt $dest, $s2, $s1
    li $t2, 30
    slt $t9, $t2, $t0       # $t9 = 1 se A > 30
    beq $t9, $zero, else_case # se !(A > 30), vai pro else

    # then: B[i] = A - 10
    li $t3, 10
    sub $t4, $t0, $t3       # A - 10 em $t4
    j store

else_case:
    # else: B[i] = A + 10
    li $t3, 10
    add $t4, $t0, $t3       # A + 10 em $t4

store:
    mul $t5, $t1, 4         # offset = i * 4
    add $t6, $s0, $t5       # endereço de B[i]
    sw $t4, 0($t6)          # B[i] = resultado

    addi $t1, $t1, 1        # i++

    j loop

endloop:
 