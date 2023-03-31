main:
    # le um numero do teclado
    addi t0, zero, 4
    ecall

    # adiciona 10 ao t1
    addi t1, zero, 10

    #checa se o numero é maior que 10
    bne t0, 

    # subtrai 10 do numero lido 
    addi a0, a0, -10 

    # imprime o resultado
  addi t0, zero, 1
  ecall

fim:
    ret
