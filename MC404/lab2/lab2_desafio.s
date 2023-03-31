main:
    #cria o iterador t1 com valor 0
    add t1, zero, zero

    #cria o limite do iterador t2
    addi t2, zero, 3

for:
    #checa se o iterador t1 chegou ao limite
    bge t1, t2, fim

    #le um numero do teclado e poe no a0
    addi t0, zero, 4
    ecall

    #subtrai 10 do a0
    addi a0, a0, -10

    #checa se o que sobrou eh menor que 0
    blt a0, zero, imprime_negativo

    #printa pq sabe que eh positivo
    addi t0, zero, 1
    ecall

    #soma um ao iterador
    addi t1, t1, 1

    j for

imprime_negativo:
    sub a0, zero, a0

    #guarda o numero em t3
    add t3, zero, a0

    #carrega o - no a0
    addi a0, zero, 45

    #printa o traco
    addi t0, zero, 2
    ecall

    #coloca o valor de t3 no a0
    add a0, zero, t3

    #printa
    addi t0, zero, 1
    ecall

    #adiciona um ao iterador
    addi t1, t1, 1

    j for

fim:
    ret


