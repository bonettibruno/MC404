.data
operacoes:
    .word '+', soma   # caractere e endereo da funcao soma
    .word '-', subtracao  # caractere e endereco da funcao subtracao


.text
# Funcao de soma
soma:
    add a0, a0, a1    # a0 = a0 + a1
    jr ra             # return

# Funcao de subtracao
subtracao:
    sub a0, a0, a1    # a0 = a0 - a1
    jr ra             # return

# Funcao principal
main:
    la t0, operacoes  # carrega o endereco da estrutura de operacaes em t0
    lb a0, 0(t0)      # le o caractere da primeira posicao da estrutura (operaca +)
    addi t0, t0, 4    # move o endereco para a proxima posicao (endereco da funcao soma)
    lw a1, 0(t0)      # le o endereco da funcao soma

    # Chama a funcao de soma utilizando a instrucao jalr
    jalr ra, a1, 0    # jalr ra, a1, 0 (ra = endereco da funcao, a1 = registrador com o endereco da funcao soma)

    # Apos a execucao da funcao de soma, o resultado estara em a0
    # Voce pode realizar a mesma logica para a operacao de subtracao

    # Fim do programa
    li a7, 10          # codigo de syscall para encerrar o programa
    ecall             # chama a syscall para encerrar o programa
