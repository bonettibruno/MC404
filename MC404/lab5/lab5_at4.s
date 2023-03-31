.data
matriz:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0

.text
main:
    #define i e j
    add t0, zero, zero   #i
    add t1, zero, zero   #j

    #limite para i e j
    addi t2, zero, 2   #imax = 2
    addi t3, zero, 3   #imax = 3

    #coloca a matriz em s0
    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

    loop:
    #percorrendo linha




    beq t0, t1, adiciona_na_matriz



adiciona_na_matriz:
    