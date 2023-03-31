main:
    #constantes
    addi t1, zero, 10
    addi t2, zero, 16
    addi t3, zero, 104

loop:
    #lendo o numero
    addi t0, zero, 4
    ecall

    #checando se esta entre 0 e 9 (eh numero)
    blt a0, zero, loop
    bge a0, t1, maiorque9

eh_numero:
    #adicionando 48 pq eh numero
    addi a0, a0, 48

    j fim

maiorque9:
    #vendo se eh ate 15
    bge a0, t2, loop

    #adicionando 55
    addi a0, a0, 55

fim:
    #printando
    addi t0, zero, 2
    ecall

    #printando o h
    addi a0, zero, 104
    addi t0, zero, 2
    ecall

    ret