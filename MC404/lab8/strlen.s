.data
    palavra: .string "arvore"

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)
    la a0, palavra

    call strlen

    lw ra, 0(sp)
    addi sp, sp, 4

    #printa o numero
    mv a1, a0
    li a0, 1
    ecall

    #acaba o programa
    li a0, 10
    ecall

strlen:
    addi sp, sp, -4
    sw s0, 0(sp)
    li s0, 0
    loop:
        lw t0, 0(a0)
        beq t0, zero, fim_loop
        addi a0, a0, 1
        addi s0, s0, 1
        j loop
    fim_loop:
        mv a0, s0
        lw s0, 0(sp)
        addi sp, sp, 4
        ret
