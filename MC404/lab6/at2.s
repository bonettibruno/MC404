.data
vetor:
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5

.text
addi zero, zero, 0

#SomaVetor(unsigned N, unsigned *v)
SomaVetor:
    #copiando os a's nos t's
    mv   t0, a0
    mv   t1, a1

    #soma do vetor em s2
    addi t2, zero, 0

for:
    #percorrendo o vetor dado
    #se chegou a 0, t0 (N), termina
    beq  t0, zero, fim

    #carrega o elemento do vetor no t3
    lw   t3, t1, 0

    add t2, t2, t3

    #anda no vetor e diminui o iterador
    addi t1, t1, 4
    addi t0, t0, -1

    j    for

fim:
    #carrega a soma (s2) no a0
    add a0, zero, t2

    ret

main:
    #poe o N no a0
    addi a0, zero, 5

    #poe o vetor no a1
    lui a1, %hi(vetor)
    addi a1, a1, %lo(vetor)

    call SomaVetor

    addi t0, zero, 1
    ecall

    ret