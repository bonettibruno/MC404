main:
    # movimenta a pilha 4 posicoes para baixo
    addi sp, sp, -4
    sw ra, 0(sp)

    # input fica em s0
    li t0, 4
    ecall

    mv s0, a0
    call fatorial

    li t0, 1
    ecall

    # movimenta a pilha 4 posicoes para cima
    lw ra, 0(sp)
    addi sp, sp, 4

    ret

# recebe a0 e devolve o fatorial do numero
fatorial:
    # movimenta a pilha 8 posicoes para baixo
    addi sp, sp, -8
    sw s0, 4(sp)
    sw ra, 0(sp)

    # auxiliar para guardar o numero 1 em t1
    li t1, 1
    beq a0, t1, fim_fatorial

    # guarda a0 em s0
    mv s0, a0

    # chama fatorial recursivamente para a0 - 1
    addi a0, a0, -1

    call fatorial

    # multiplicar resultado por s0 e devolver
    # resultado esta em a0
    mv a1, s0
    call Multiplica

    fim_fatorial:

    # movimenta a pilha 8 posicoes para cima
    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8    

    ret

Multiplica:
    # Multiplica a0 por a1 e guarda o resultado em a0
    mv   t0, zero
loop:
    beq  a0, zero, fimMultiplica
    andi t1, a0, 1
    beq  t1, zero, nao
    add  t0, t0, a1
nao:
    slli a1, a1, 1
    srli a0, a0, 1
    j    loop
fimMultiplica:
    mv   a0, t0
    ret
