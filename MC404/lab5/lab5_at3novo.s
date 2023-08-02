.rodata
vetor_0:
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5

vetor_1:
    .word 10
    .word 10
    .word 10
    .word 10
    .word 10

.data
vetor_2:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0

.text
main:
    #adicionando constantes e iteradores
    #iterador t3 = 5
    addi t3, zero, 5

    #soma = s3
    add s3, zero, zero

    #guardando os vetores em registradores:
    #vetor 0 no s0
    lui s0, %hi(vetor_0)
    addi s0, s0, %lo(vetor_0)

    #vetor 1 no s1
    lui s1, %hi(vetor_1)
    addi s1, s1, %lo(vetor_1)

    #vetor 2 no s2
    lui s2, %hi(vetor_2)
    addi s2, s2, %lo(vetor_2)

loop:
    #lendo do vetor_0 e vetor_1
    lw t0, s0, 0
    lw t1, s1, 0

    #somando e colocando no vetor_2
    add t2, t0, t1
    sw t2, s0, 0

    #somando tambem no soma
    add s3, s3, t2

    #aumentando 4 nos 3 vetores
    addi s0, s0, 4
    addi s1, s1, 4
    addi s2, s2, 4

    #tirando um do iterador
    addi t3, t3, -1

    beq t3, zero, fim

    j loop

fim:
    #printando o soma
    add a0, zero, s3
    addi t0, zero, 1
    ecall

    ret