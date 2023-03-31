.data
matriz:
    .word 1212
    .word 3
    .word 0
    .word 0
    .word 0
    .word 0

.text
main:
    #coloca a matriz em s0
    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

    lw t0, 0(s0)
    add a0, t0, zero
    addi t0, zero, 1
    ecall

    #anda 4 no vetor:
    addi s0, s0, 4

    lw t0, 0(s0)
    add a0, t0, zero
    addi t0, zero, 1
    ecall

    ret


