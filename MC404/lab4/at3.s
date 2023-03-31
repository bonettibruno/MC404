main:
    #lendo o caractere
    addi t0, zero, 4
    ecall

    #definindo as constantes
    addi t1, zero, 97
    addi t2, zero, 129
    addi t3, zero, 32

    #checando se eh letra e minuscula
    blt a0, t1, main
    bge a0, t2, main

    #printando a letra minuscula
    addi t0, zero, 2
    ecall

    #tornando ela maiuscula
    sub a0, a0, t3

    #printando a minuscula
    addi t0, zero, 2
    ecall

    ret