#232488 - Bruno Monteiro Bonetti
.data
    numbers: .word 0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110, 0b001101101, 0b01111101, 0b00000111, 0b01111111, 0b01100111

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)
    # definindo contador
    li s0, 0

    # definindo sentido de contagem (0 eh crescente, 1 eh decrescente)
    li s1, 0

    #constantes para logica do loop
    li s2, 1
    li s3, 2

    loop:
        call botoes
        beq a0, s2, eh_decrescente
        beq a0, s3, eh_crescente
        j continuando

        eh_crescente:
            li s1, 0
            j continuando
        eh_decrescente:
            li s1, 1
            j continuando

        continuando:
            li t0, 1
            beq s1, zero, cresce
            beq s2, t0, decresce

            cresce:
                mv a0, s0
                call crescente
                mv s0, a0
                call acende_verde
                j fim_loop
            
            decresce:
                mv a0, s0
                call decrescente
                mv s0, a0
                call acende_vermelho
                j fim_loop

            fim_loop:
            mv a0, s0
            call display

            li a0, 750
            call pausa

            j loop

    lw ra, 0(sp)
    addi sp, sp, 4

    addi a0, zero, 10
    ecall

display:
    # recebe no a0, qual o numero que esta no contador

    # Dividindo o número em primeiro e segundo algarismos
    li t2, 10

    #inicializa t0 e t1
    li t0, 0       
    li t1, 0       

    div t0, a0, t2  # segundo algarismo
    rem t1, a0, t2  # primeiro algarismo

    #multiplica por 4 o valor de t0 e t1
    slli t0, t0, 2
    slli t1, t1, 2

    # Carregando o valor binário correspondente para t0
    la t3, numbers
    add t3, t0, t3 
    lw t0, 0(t3)

    # Carregando o valor binário correspondente para t1
    la t3, numbers
    add t3, t1, t3 # Adiciona o deslocamento ao endereço base
    lw t1, 0(t3)

    li a0, 0x120

    slli t0, t0, 8

    add t4, t0, t1

    mv a1, t4
    li a2, -1
    ecall

    ret

pausa:
    li t0, 0
    
    loop_pausa:
    beq t0, a0, fim_pausa
    addi t0, t0, 1
    j loop_pausa

    fim_pausa:
        ret

botoes:
    li a0, 0x122
    ecall

    ret

crescente:
    li t0, 99
    beq a0, t0, eh_99
    addi a0, a0, 1
    j fim_crescente

    eh_99:
        li a0, 0

    fim_crescente:
        ret

decrescente:
    beq a0, zero, eh_0
    addi a0, a0, -1
    j fim_decrescente

    eh_0:
        li a0, 99

    fim_decrescente:
        ret

acende_vermelho:
    li a0, 0x121
    li a1, 2
    ecall

    ret

acende_verde:
    li a0, 0x121
    li a1, 1
    ecall

    ret