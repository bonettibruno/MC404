.data
vetor: 
    .word 10
    .word 20
    .word 30

.text
main:
    #limite t2 definido como 3 e iterador t1 como 0
    add t1, zero, zero
    addi t2, zero, 3

    #soma sera guardada em t3
    add t3, zero, zero

    #guardando o valor 0 no t4, para ser usado ao mover os bits do vetor
    addi t4, zero, 0

    #t5 eh 0
    add t5, zero, zero

loop:
    #checa se realizou as tres iteracoes
    beq t1, t2, fim

    #le o vetor e colocar o valor em t0
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)
    lw t0, s0, 0

    #soma sera armazenada em t5
    add t5, t5, t0

    lw t0, s0, 4
    add t5, t5, t0

    lw t0, s0, 8
    add t5, t5, t0

    #printando t5
    add a0, zero, t5
    addi t0, zero, 1
    ecall

fim:
    ret


