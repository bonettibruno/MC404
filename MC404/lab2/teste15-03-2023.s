# codigo que le dois numeros inteiros, se forem iguais acaba programa
# depois soma e printa, infinitamente

main:
    #le numero inteiro e coloca no a0
    addi t0, zero, 4
    ecall

    #coloca o numero do a0 no t1
    add t1, zero, a0

    #le numero inteiro e coloca no a0
    addi t0, zero, 4
    ecall

    #coloca o numero do a0 no t2
    add t2, zero, a0

    #se t1 e t2 forem iguais acaba o programa
    beq t1, t2, fim

    #soma t1 e t2 e poe no t3
    add t3, t1, t2

    #coloca o valor de t3 no a0
    add a0, zero, t3

    #printa o a0
    addi t0, zero, 1
    ecall

    j main

fim:
    ret
