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
    #soma para saber em qual elemento deve ser adionado o i+j
    add s3, zero, zero


    #iterador para linha=s1
    #iterador para coluna=s2
    add s1, zero, zero
    add s2, zero, zero

    percorrendo_a_linha:
        beq s1, t0, percorrendo_coluna
        addi, s3, s3, 3 #adiciona 3 no s3 que define qual elemento do vetor deve ser adicionado
        addi s1, s1, 1

        j percorrendo_a_linha
    
    percorrendo_coluna:
        beq s2, t1, fim_da_coluna #se chegou no j que estamos, sai
        addi s3, s3, 1
        addi s2, s2, 1

        j percorrendo_coluna
    
    fim_da_coluna:
        #ja temos qual o indice do vetor(matriz), basta adicionar a soma i + j no vetor:
        #somando i + j e guardando em s4:
        add s4, t0, t1
        sw s4, 0(s0)
    j loop


        