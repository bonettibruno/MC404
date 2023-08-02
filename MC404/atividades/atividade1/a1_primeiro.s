#232488 - Bruno Monteiro Bonetti

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
    #0000000000000000
    #0000000000000000
    #0000000001111111
    #0000000000000001
    #0000000000000001
    #0000000000000001
    #0000000001111111
    #0000000001000000
    #0000000001000000
    #0000000001111111
    #0000000000000000
    #0000000000000000

    li a0, 0x110
    li a1, 9
    li a2, 0b0000000001111111
    ecall

    li a0, 0x110
    li a1, 8
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 7
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 6
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 5
    li a2, 0b0000000001111111
    ecall

    li a0, 0x110
    li a1, 4
    li a2, 0b0000000001000000
    ecall

    li a0, 0x110
    li a1, 3
    li a2, 0b0000000001000000
    ecall

    li a0, 0x110
    li a1, 2
    li a2, 0b0000000001111111
    ecall

    ret

tres:
    #0000000000000000
    #0000000000000000
    #0000000001111111
    #0000000000000001
    #0000000000000001
    #0000000000011111
    #0000000000000001
    #0000000000000001
    #0000000000000001
    #0000000001111111
    #0000000000000000
    #0000000000000000

    li a0, 0x110
    li a1, 9
    li a2, 0b0000000001111111
    ecall

    li a0, 0x110
    li a1, 8
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 7
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 6
    li a2, 0b0000000000011111
    ecall

    li a0, 0x110
    li a1, 5
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 4
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 3
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 2
    li a2, 0b0000000001111111
    ecall


    ret

quatro:
    #0000000000000000
    #0000000000000000
    #0000000001000001
    #0000000001000001
    #0000000001000001
    #0000000001111111
    #0000000000000001
    #0000000000000001
    #0000000000000001
    #0000000000000001
    #0000000000000000
    #0000000000000000

    li a0, 0x110
    li a1, 9
    li a2, 0b0000000001000001
    ecall

    li a0, 0x110
    li a1, 8
    li a2, 0b0000000001000001
    ecall

    li a0, 0x110
    li a1, 7
    li a2, 0b0000000001000001
    ecall

    li a0, 0x110
    li a1, 6
    li a2, 0b0000000001111111
    ecall

    li a0, 0x110
    li a1, 5
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 4
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 3
    li a2, 0b0000000000000001
    ecall

    li a0, 0x110
    li a1, 2
    li a2, 0b0000000000000001
    ecall


    ret


oito:
    #0000000000000000
    #0000000000000000
    #0000000001111111
    #0000000001000001
    #0000000001000001
    #0000000000111110
    #0000000001000001
    #0000000001000001
    #0000000001000001
    #0000000001111111
    #0000000000000000
    #0000000000000000

    li a0, 0x110
    li a1, 9
    li a2, 0b0000000001111111
    ecall

    li a0, 0x110
    li a1, 8
    li a2, 0b0000000001000001
    ecall

    li a0, 0x110
    li a1, 7
    li a2, 0b0000000001000001
    ecall

    li a0, 0x110
    li a1, 6
    li a2, 0b0000000000111110
    ecall

    li a0, 0x110
    li a1, 5
    li a2, 0b0000000001000001
    ecall

    li a0, 0x110
    li a1, 4
    li a2, 0b0000000001000001
    ecall

    li a0, 0x110
    li a1, 3
    li a2, 0b0000000001000001
    ecall

    li a0, 0x110
    li a1, 2
    li a2, 0b0000000001111111
    ecall

    ret

limpadordetela:
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000
    #0000000000000000

    li a0, 0x110
    li a2, 0

    li a1, 2
    ecall

    li a1, 3
    ecall

    li a1, 4
    ecall

    li a1, 5
    ecall

    li a1, 6
    ecall

    li a1, 7
    ecall

    li a1, 8
    ecall

    li a1, 9
    ecall

    ret

pausa:
    li t0, 0
    
    loop:
    beq t0, a0, fim_pausa
    addi t0, t0, 1
    j loop

    fim_pausa:
        ret
