.text

TamanhoString: #TamanhoString()
    addi sp, sp, -9
    sw ra, sp, 0
    addi a0, sp, 4 #vetor
    
    #configura para leitura de string de 5 caracteres e guarda no endereco a0
    li a1, 5

    li t0, 6 #leitura de String
    ecall
    #string ta no endereco a0

    call strlen
    #quantidade de caracteres ja esta em a0

    lw ra, sp, 0
    addi sp, sp, 9

    ret

strlen: #int strlen(char *s)
    #  saida: a0        entrada: a0

    #guardando na pilha os s0, s1, s2, s3
    addi sp, sp, -24
    sw s4, sp, 20
    sw s0, sp, 16
    sw s1, sp, 12
    sw s2, sp, 8
    sw s3, sp, 4
    sw ra, sp, 0

    #contador
    li s1, -1

    #compara com espaco (tabela ascii 32)
    li s3, 32 

    #coloca o a0 no s0
    mv s0, a0

    #maximo de caracteres eh 5
    li s4, 5

    while:
        #carrega o byte em s2
    	lb s2, s0, 0

        #soma 1 em s0 e s1
    	addi s0, s0, 1
    	addi s1, s1, 1

        #verifica se chegou ao fim do "vetor"
    	bge s1, s4, fim

        #ve se nao eh espaco o caractere
    	bne s2, s3, while

    fim:
        #coloca o valor de s1 (soma de qtd de caracteres) em a0
        mv a0, s1

        #tira da pilha
        lw s4, sp, 20
        lw s0, sp, 16
        lw s1, sp, 12
        lw s2, sp, 8
        lw s3, sp, 4
        lw ra, sp, 0
        addi sp, sp, 24
    
        ret

main:
    addi sp, sp, -4
    sw ra, sp, 0
    call TamanhoString

    #printando
    li t0, 1
    ecall

    lw ra, sp, 0
    addi sp, sp, 4

    ret


