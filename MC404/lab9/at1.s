.text
main:
    addi sp, sp, -4     
    sw ra, 0(sp)
    
    # Chama a função LeNumero e armazena o resultado em s0
    call LeNumero
    mv s0, a0
    
    # Imprime o número lido
    li a0, 1              # A0 = 1 (identificador do terminal)
    mv a1, s0             # A1 = número lido
    ecall                 # Chamada de sistema para imprimir o número
    
    lw ra, 0(sp)
    addi sp, sp, 4

    addi a0, zero, 10
    ecall   # Encerra a execução do programa

LeNumero:
    li a0, 0x130
    ecall

    li a0, 0x131
    ecall

    ret