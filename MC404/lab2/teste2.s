main:
    #le primeiro numero e poe no a0
    addi t0, zero, 4
    ecall

    #se for 0, acaba o programa
    beq a0, zero, fim

    #poe o a0 no t1
    add t1, zero, a0

    #le segundo numero
    addi t0, zero, 4
    ecall

    #se for 0, acaba programa
    beq a0, zero, fim

    #coloca segundo numero no t2
    add t2, zero, a0

    #salta se t1 menor que t2 
    blt t1, t2, imprime_t2

    #coloca t1 no a0
    add a0, zero, t1

    #printa
    addi t0, zero, 1
    ecall

    ret

imprime_t2:
    #adiciona valor de t2 no a0
    add a0, zero, t2

    #printa o a0
    addi t0, zero, 1
    ecall
    
    ret
