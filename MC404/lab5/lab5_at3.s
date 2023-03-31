.rodata
vetor_0:
    .word 10
    .word 10
    .word 10
    .word 10
    .word 10

vetor_1:
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5

.data
vetor_2:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0

.text
main:
    #soma sera guardada em s3
    add s3, zero, zero

    #colocando o primeiro vetor no s0
    lui s0, %hi(vetor_0)
    addi s0, s0, %lo(vetor_0)

    #colocando o segundo vetor no s1
    lui s1, %hi(vetor_1)
    addi s1, s1, %lo(vetor_1)

    #colocando o terceiro vetor no s2
    lui s2, %hi(vetor_2)
    addi s2, s2, %lo(vetor_2)

    #lendo o primeiro indice de cada, somando e colocando no s2
    lw t0, s0, 0
    lw t1, s1, 0
    add t2, t0, t1
    add s3, s3, t2
    sw t2, s2, 0

    #lendo o segundo indice de cada, somando e colocando no s2
    lw t0, s0, 4
    lw t1, s1, 4
    add t2, t0, t1
    add s3, s3, t2
    sw t2, s2, 4

    #lendo o terceiro indice de cada, somando e colocando no s2
    lw t0, s0, 8
    lw t1, s1, 8
    add t2, t0, t1
    add s3, s3, t2
    sw t2, s2, 8

    #lendo o quarto indice de cada, somando e colocando no s2
    lw t0, s0, 12
    lw t1, s1, 12
    add t2, t0, t1
    add s3, s3, t2
    sw t2, s2, 12

    #lendo o quinto indice de cada, somando e colocando no s2
    lw t0, s0, 16
    lw t1, s1, 16
    add t2, t0, t1
    add s3, s3, t2
    sw t2, s2, 16

    #printando a soma
    add a0, zero, s3
    addi t0, zero, 1
    ecall

    ret