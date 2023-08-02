.data
    str1: .string "oi"
    str2: .string "tudobem"

.text
main:
    la a0, str1
    la a1, str2

    addi sp, sp, -4
    sw ra, 0(sp)

    call strcat

    lw ra, 0(sp)
    addi sp, sp, 4

    # imprimir a string concatenada
    li a0, 4       # carregar o número do syscall para imprimir string
    mv a1, t0      # carregar o endereço da string concatenada
    ecall

    addi a0, zero, 10
    ecall   # Encerra a execução do programa


#char * strcat(char *s1, char *s2) que concatena as strings s1 e s2 e retorna o resultado em s1
strcat:
    addi t0, a0, 0
strcat_loop:
    lbu t1, 0(a0)
    beq t1, zero, strcat_copy
    addi a0, a0, 1
    j strcat_loop
strcat_copy:
    lbu t1, 0(a1)
    sb t1, 0(a0)
    beq t1, zero, strcat_end
    addi a0, a0, 1
    addi a1, a1, 1
    j strcat_copy
strcat_end:
    addi a0, t0, 0
    ret
