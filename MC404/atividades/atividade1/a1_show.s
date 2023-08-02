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

    li a3, 2
    call numero

    li a0, 1000
    call pausa

    li a3, 3
    call numero

    li a0, 1000
    call pausa

    li a3, 2
    call numero

    li a0, 1000
    call pausa

    li a3, 4
    call numero

    li a0, 1000
    call pausa

    li a3, 8
    call numero

    li a0, 1000
    call pausa
    
    call limpadordetela
    li a0, 500
    call pausa

    li a3, 8
    call numero

    li a0, 1000
    call pausa

    lw ra, 0(sp)
    addi sp, sp, 4

    addi a0, zero, 10
    ecall   # Encerra a execução do programa

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

numero:
#selecionando o numero
    addi t0, zero, 2
    addi t1, zero, 3
    addi t2, zero, 4
    addi t3, zero, 8

    beq a3, t0, eh_dois
    beq a3, t1, eh_tres
    beq a3, t2, eh_quatro
    beq a3, t3, eh_oito

    eh_dois:
    la s0, two
    j plot

    eh_tres:
    la s0, three
    j plot

    eh_quatro:
    la s0, four
    j plot

    eh_oito:
    la s0, eight
    j plot

#comecando a plotar o numero desejado
    plot:
    li a0, 0x110
    li a1, 9
    li t0, 1
    add s1, s0, zero

    loop_numero:
        lw a2, 0(s0)
        ecall
        addi s0, s0, 4
        addi a1, a1, -1
        beq a1, t0, fim_loopnumero
        j loop_numero

    fim_loopnumero:
        #contador ate 16
        addi t1, t1, 16
    move_numero:
        beqz t1, zero, fim
        addi t1, t1, -1
        

    

    fim:
        ret