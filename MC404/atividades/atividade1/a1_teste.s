#232488 - Bruno Monteiro Bonetti
.data
    two: .word 0b0000000001111111, 0b0000000000000001, 0b0000000000000001, 0b0000000000000001, 0b0000000001111111, 0b0000000001000000, 0b0000000001000000, 0b0000000001111111
    three: .word 0b0000000001111111, 0b0000000000000001, 0b0000000000000001, 0b0000000000011111, 0b0000000000000001, 0b0000000000000001, 0b0000000000000001, 0b0000000001111111
    four: .word 0b0000000001000001, 0b0000000001000001, 0b0000000001000001, 0b0000000001111111, 0b0000000000000001, 0b0000000000000001, 0b0000000000000001, 0b0000000000000001
    eight: .word 0b0000000001111111, 0b0000000001000001, 0b0000000001000001, 0b0000000000111110, 0b0000000001000001, 0b0000000001000001, 0b0000000001000001, 0b0000000001111111

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    call dois

    li a0, 1000
    call pausa

    call tres

    li a0, 1000
    call pausa

    call dois

    li a0, 1000
    call pausa

    call quatro

    li a0, 1000
    call pausa

    call oito

    li a0, 1000
    call pausa
    
    call limpadordetela
    li a0, 500
    call pausa

    call oito

    li a0, 1000
    call pausa

    lw ra, 0(sp)
    addi sp, sp, 4

    addi a0, zero, 10
    ecall   # Encerra a execução do programa

dois:
    li a0, 0x110
    li a1, 9
    la s0, two
    li t0, 1

    loop_dois:
        lw a2, 0(s0)
        ecall
        addi s0, s0, 4
        addi a1, a1, -1
        beq a1, t0, fim_loopdois
        j loop_dois

    fim_loopdois:
        ret

tres:
    li a0, 0x110
    li a1, 9
    la s0, three
    li t0, 1

    loop_tres:
        lw a2, 0(s0)
        ecall
        addi s0, s0, 4
        addi a1, a1, -1
        beq a1, t0, fim_looptres
        j loop_tres

    fim_looptres:
        ret

quatro:
    li a0, 0x110
    li a1, 9
    la s0, four
    li t0, 1

    loop_quatro:
        lw a2, 0(s0)
        ecall
        addi s0, s0, 4
        addi a1, a1, -1
        beq a1, t0, fim_loopquatro
        j loop_quatro

    fim_loopquatro:
        ret

oito:
    li a0, 0x110
    li a1, 9
    la s0, eight
    li t0, 1

    loop_oito:
        lw a2, 0(s0)
        ecall
        addi s0, s0, 4
        addi a1, a1, -1
        beq a1, t0, fim_loopoito
        j loop_oito

    fim_loopoito:
        ret


limpadordetela:
    li a0, 0x110
    li a2, 0
    li a1, 0
    li t0, 11

    loop_limpatela:
    beq a1, t0, fim_limpatela
    addi a1, a1, 1
    ecall
    j loop_limpatela

    fim_limpatela:
    ret

pausa:
    li t0, 0
    
    loop:
    beq t0, a0, fim_pausa
    addi t0, t0, 1
    j loop

    fim_pausa:
        ret
