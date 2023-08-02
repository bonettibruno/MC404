.data
    str1: .string "123456789"
    str2: .string "carre"

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    #colocando o endereco de str1 no a0
    la a0, str1

    #colocando o endereco de str2 no a1
    la a1, str2

    call strcpy

    #printando o str1
    li a0, 4
    la a1, str1
    ecall

    #printando o str2
    li a0, 4
    la a1, str2
    ecall

    lw ra, 0(sp)
    addi sp, sp, 4

    addi a0, zero, 10
    ecall   # Encerra a execução do programa

#char * strcpy(char *s1, char *s2) copia da 2 pra 1
#a0 <= s1, a1 <= s2
strcpy:
    #coloca o conteudo de a1 em t0
    lbu t0, 0(a1)

    #verifica se ta no 0, pq dai acabou a string
    beq t0, zero, strcpy_end
    sb t0, 0(a0)
    addi a0, a0, 1
    addi a1, a1, 1
    j strcpy
strcpy_end:
    ret
