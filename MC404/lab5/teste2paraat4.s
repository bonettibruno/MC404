.data
matriz:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0

.text
main:
    #define i e j
    add t0, zero, zero   #i
    add t1, zero, zero   #j

    #limite para i e j
    addi t2, zero, 2   #imax = 2
    addi t3, zero, 3   #imax = 3

    #coloca a matriz em s0
    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

loop:
    #calculando endereço do elemento
    sll s1, t0, 1       #multiplica i por 2
    add s1, s1, t0      #multiplica i por 3
    sll s1, s1, 2       #multiplica novamente por 4 para considerar que cada elemento ocupa 4 bytes
    add s1, s1, s0      #s1 = endereço do elemento (i,j)

    #adiciona i+j no elemento (i,j)
    add s4, t0, t1      #s4 = i+j
    sw s4, (s1,s0)      #salvando valor na matriz

    #incrementa j
    addi t1, t1, 1
    bne t1, t3, loop    #se j != 3, volta para o início do loop interno

    #incrementa i e reseta j
    addi t0, t0, 1
    addi t1, zero, 0
    bne t0, t2, loop    #se i != 2, volta para o início do loop externo

    #imprime a matriz
    la a0, matriz
    li a1, 6
    li a2, 4
    li v0, 4
    syscall

    #finaliza programa
    li v0, 10
    syscall
