main:
    #lendo o caractere
    addi t0, zero, 4
    ecall

    #definindo as duas constantes
    addi t1, zero, 65
    addi t2, zero, 97

    #checando se eh letra e maiuscula
    blt a0, t1, main
    bge a0, t2, main

    #printando a letra maiuscula
    addi t0, zero, 2
    ecall

    #tornando ela minuscula
    addi a0, a0, 32

    #printando a minuscula
    addi t0, zero, 2
    ecall

    ret