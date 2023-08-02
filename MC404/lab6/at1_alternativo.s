.data
vetor:
    .word 1
    .word 1
    .word 1
    .word 1
    .word 1

.text
#MultiplicaVetor(unsigned N (a0), unsigned *v(a1), unsigned fator(a2))
MultiplicaVetor:
    # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
    addi sp, sp, -16
    sw   s0, 12(sp)
    sw   s1, 8(sp)
    sw   s2, 4(sp)
    sw   ra, 0(sp)

    #copiando os a's nos s's
    mv   s0, a0
    mv   s1, a1
    mv   s2, a2

for:
    #percorrendo o vetor dado
    #se chegou a 0, s0 (N), termina
    beqz  s0, fim

    #carrega o elemento do vetor no a0
    lw   a0, 0(s1)

    #carrega o fator de multiplicacao no a1
    mv   a1, s2

    #Multiplica recebe os fatores no a0 e a1, e devolve no a0
    call Multiplica

    #carrega no vetor o valor multiplicado pela Multiplica
    sw   a0, 0(s1)

    #anda no vetor e diminui o iterador
    addi s1, s1, 4
    addi s0, s0, -1

    j    for

fim:
    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, 0(sp)
    lw   s2, 4(sp)
    lw   s1, 8(sp)
    lw   s0, 12(sp)
    addi sp, sp, 16
    ret

Multiplica:
    mv t0, a0
    mv t1, a1
    
    mv t2, a1
    #soma vai ficar aq

    
    for_multiplica:
        addi t1, t1, -1
        add t2, t2, t0

        bnez t1, for_multiplica
    
    mv a0, t2

    ret

main:
    #poe o vetor no a1
    lui a1, %hi(vetor)
    addi a1, a1, %lo(vetor)

    #poe o N no a0
    addi a0, zero, 5

    #poe o fator no a2
    addi a2, zero, 10

    jal MultiplicaVetor

    ret
