.data
vetor:
    .word 1
    .word 1
    .word 1
    .word 1
    .word 1

.text
addi zero, zero, 0

#MultiplicaVetor(unsigned N (a0), unsigned *v(a1), unsigned fator(a2))
MultiplicaVetor:
    # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
    addi sp, sp, -16
    sw   s0, sp, 12
    sw   s1, sp, 8
    sw   s2, sp, 4
    sw   ra, sp, 0

    #copiando os a's nos s's
    mv   s0, a0
    mv   s1, a1
    mv   s2, a2

for:
    #percorrendo o vetor dado
    #se chegou a 0, s0 (N), termina
    beq  s0, zero, fim

    #carrega o elemento do vetor no a0
    lw   a0, s1, 0

    #carrega o fator de multiplicacao no a1
    mv   a2, s2

    #Multiplica recebe os fatores no a0 e a1, e devolve no a0
    call Multiplica

    #carrega no vetor o valor multiplicado pela Multiplica
    sw   a0, s1, 0

    #anda no vetor e diminui o iterador
    addi s1, s1, 4
    addi s0, s0, -1

    j    for

fim:
    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, sp, 0
    lw   s2, sp, 4
    lw   s1, sp, 8
    lw   s0, sp, 12
    addi sp, sp, 16
    ret

Multiplica:
    mv t0, a0
    mv t1, a2    
    add t2, zero, zero
    #soma vai ficar aq

    
    for_multiplica:
        addi t1, t1, -1
        add t2, t2, t0

        bne t1, zero, for_multiplica
    
    add a0, zero, t2

    ret

main:
    #poe o vetor no a1
    lui a1, %hi(vetor)
    addi a1, a1, %lo(vetor)

    #poe o N no a0
    addi a0, zero, 5

    #poe o fator no a2
    addi a2, zero, 10

    call MultiplicaVetor

    ret