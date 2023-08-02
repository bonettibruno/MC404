.data
    str1: .string "oi"
    str2: .string "oi"

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    call strcmp

    lw ra, 0(sp)
    addi sp, sp, 4

    #printa o numero
    mv a1, a0
    li a0, 1
    ecall
    
    #acaba o programa
    li a0, 10
    ecall



#int strcmp(char *s1, char *s2) que compara as strings s1 e s2 e retorna 0 se elas forem iguais,
# um valor negativo se s1 for menor que s2 e um valor positivo se s1 for maior que s2.
strcmp:
    lbu t0, a0, 0
    lbu t1, a1, 0
    bne t0, t1, strcmp_cmp
    beq t0, zero, strcmp_neg
    beq t1, zero, strcmp_pos
    addi a0, a0, 1
    addi a1, a1, 1
    j strcmp
strcmp_cmp:
    sub a0, t0, t1
    j strcmp_end
strcmp_neg:
    addi a0, zero, -1
    j strcmp_end
strcmp_pos:
    addi a0, zero, 1
strcmp_end:
    ret
