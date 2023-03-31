main:
    #adicionando constantes
    addi t1, zero, 65
    addi t2, zero, 90
    addi t3, zero, 97
    addi t4, zero, 122
    addi t5, zero, 32

    #lendo caractere do teclado:
    addi t0, zero, 4
    ecall

    #guardando o valor em a0
    add s0, zero, a0

    #checando se eh maiuscula
    blt s0, t1, fim    #ja vai pro fim pq n eh letra
    bge s0, t2, nao_eh_maiuscula

    #tornando a maiuscula, minuscula
    add s0, s0, t5

    j fim

nao_eh_maiuscula:
    #mas o valor eh maior que 90
    #checando se eh minuscula
    blt s0, t3, fim
    bge s0, t4, fim
    
    #tornando a minuscula, maiuscula
    sub s0, s0, t5

fim:
    #colocando s0 no a0 e printando
    add a0, zero, s0
    addi t0, zero, 2
    ecall

    ret