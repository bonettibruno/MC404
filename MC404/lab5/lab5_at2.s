.data
vetor: 
    .word 10
    .word 20
    .word 30

.text
main:
    #coloca o vetor no s0
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)

    #carrega o valor do primeiro elemento do vetor em t0
    lw t0, s0, 0

    #soma 1 t0 e coloca o t0 no primeiro elemento do vetor
    addi t0, t0, 1
    sw t0, s0, 0

    #carrega o valor do segundo elemento do vetor em t0
    lw t0, s0, 4

    #soma 1 t0 e coloca o t0 no segundo elemento do vetor
    addi t0, t0, 1
    sw t0, s0, 4

    #carrega o valor do terceiro elemento do vetor em t0
    lw t0, s0, 8

    #soma 1 t0 e coloca o t0 no terceiro elemento do vetor
    addi t0, t0, 1
    sw t0, s0, 8

    #lendo o vetor para printar:

    #lendo e printando primeiro elemento
    lw a0, s0, 0
    addi t0, zero, 1
    ecall

    #lendo e printando segundo elemento
    lw a0, s0, 4
    addi t0, zero, 1
    ecall

    #lendo e printando terceiro elemento
    lw a0, s0, 8
    addi t0, zero, 1
    ecall

    ret 