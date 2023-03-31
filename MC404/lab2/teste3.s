main:
    #atribui 0 ao iterador t1
    add t1, zero, zero

    #define t2 com a quantidade de vezes a ser iterado
    #le o numero e poe no a0
    addi t0, zero, 4
    ecall

    #se for zero, acaba programa
    beq a0, zero, fim

    #poe no t2
    add t2, zero, a0

loop:
    #se t1 igual t2 eh maior igual, chegou ao fim das iteracoes
    bge t1, t2, fim

    #le numero 
    addi t0, zero, 4
    ecall

    #poe 4 no t3
    addi t3, zero, 4

    #subtrai 4 do numero
    sub a0, a0, t3

    #printa
    addi t0, zero, 1
    ecall

    #aumenta 1 no iterador
    addi t1, t1, 1

    j loop

fim:
    ret