main:
    #define constantes

loop:
    #lendo o numero
    addi t0, zero, 4
    ecall

    #se for 0, acaba
    beq a0, zero, fim

    #guardando em t1
    add t1, a0, zero

fim:   
    ret