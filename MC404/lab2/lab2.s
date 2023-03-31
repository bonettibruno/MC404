main:
    # define t1 como 0
    add t1, zero, zero

    # define t2 como 11
    addi t2, zero, 11

loop:
    #testa se t1 eh maior ou igual a 11, para sair do loop
    bge t1, t2, fim

    # le um numero e coloca no a0
    addi t0, zero, 4
    ecall

    # se o numero digitado eh 0, vai pro fim
    beq a0, zero, fim

    # Soma 2 ao valor de a0
    addi a0, a0, 2

    # Imprima o valor de a0 na tela
    addi t0, zero, 1
    ecall

    #soma 1 a t1
    addi t1, t1, 1

    # Va novamente para o main e recomece a execucao
    j loop

fim:
    ret