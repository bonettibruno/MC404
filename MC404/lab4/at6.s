main:
    #constante
    addi t3, zero, 4
    addi t4, zero, 10
    
    j loop

printa_h:
    #printando o h
    addi a0, zero, 104
    addi t0, zero, 2
    ecall

loop:
    #define constantes do loop de ler bits
    addi t2, zero, 8

    #lendo o numero
    addi t0, zero, 4
    ecall

    #se for 0, acaba
    beq a0, zero, fim

    #guardando em s0
    add s0, a0, zero

loop_ler_bits:
    #chegou no fim do loop, volta pra ler outro numero
    beq t2, zero, printa_h

    #subtraindo do iterador
    sub t2, t2, t3

    #deslocando bits e guardando em s1
    srl s1, s0, t2

    #fazendo o andi com o numero deslocado e guardando em s2
    andi s2, s1, 15

    #checando se esta entre 0 e 9 (eh numero)
    bge s2, t4, maiorque9

eh_numero:
    #adicionando 48 pq eh numero
    addi s2, s2, 48

    #printando numero
    add a0, s2, zero
    addi t0, zero, 2
    ecall
    
    j loop_ler_bits

maiorque9:
    #adicionando 55
    addi s2, s2, 55

    #printando a letra
    add a0, s2, zero
    addi t0, zero, 2
    ecall

    j loop_ler_bits

fim:  
    ret

