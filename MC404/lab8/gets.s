.data
    str0: .space 5
.text
main:
    call gets
    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)
    li a0, 10
    ecall          # Encerra o programa


gets:
    addi sp, sp, -4
    sw s1, 0(sp)

    #ponteiro pra string que vai ser recebida do teclado
    la a2, str0

    #numero de caracteres da string
    li s1, 5

    #quero receber algo do teclado
    li a0, 0x130
    ecall

    laco_gets:
    #inteiro para checar a resposta no a0 da entrada no teclado
    addi t2, zero, 2
    #verifica se ha algo a ser recebido e armazena em a1
    li a0, 0x131
    #digitar string de 4 digitos em cima desse ecall
    ecall
    bne a0, t2, fim_gets 
    sb a1, 0(a2)
    addi a2, a2, 1
    j laco_gets

    fim_gets:
    addi a2, a2, -4
    mv a1, a2
    li a0, 4
    ecall

    lw s1, 0(sp)
    addi sp, sp, 4

    ret
