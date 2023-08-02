.data
string:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0

.text
main:
    #colocando a string em a0 para poder ler
    lui a0, %hi(string)
    addi a0, a0, %lo(string)

    #definindo o limite de tamanho da string em a1
    addi a1, zero, 20

    #lendo a string
    addi t0, zero, 6
    ecall

    #loop para contar quantos zeros temos
    #registrador para contagem de zeros = s0
    add s0, zero, zero

    #registrador limite do loop = s1
    addi s1, zero, 5

    lw t1, a0, 0

    #se t1 eh zero, soma um na contagem
    bne t1, zero, loop

    #como a0 eh zero, soma um na contagem
    addi s0, s0, 1

loop:
    #andando na string
    addi a0, a0, 4
    lw t1, a0, 0

    #se o s1 for zero, chegou no fim do loop
    beq s1, zero, fim

    #diminuindo 1 no iterador
    addi s1, s1, -1

    #se a0 eh zero, soma um na contagem
    bne t1, zero, loop

    #como a0 eh zero, soma um na contagem
    addi s0, s0, 1

    j loop

fim:
    #printando tamanho da string
    add a0, zero, s0

    addi t0, zero, 1
    ecall

    ret



