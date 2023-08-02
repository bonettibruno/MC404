.data
    numbers: .word 0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110, 0b001101101, 0b01111101, 0b00000111, 0b01111111, 0b01100111

.text
main:
    # definindo contadores
    li a0, 23
    call display

display:
    # recebe no a0, qual o numero que esta no contador

    # Dividindo o número em primeiro e segundo algarismos
    li t2, 10       # Carrega o valor 10 em t2

    li t0, 0        # Inicializa t0 com zero
    li t1, 0        # Inicializa t1 com zero
    
    div t0, a0, t2  # primeiro algarismo
    rem t1, a0, t2  # segundo algarismo

    # Calculando o deslocamento
    slli t3, t0, 2  # Multiplica o primeiro algarismo por 4 (cada entrada da tabela ocupa 4 bytes)
    add t3, t3, t3  # Multiplica por 2 novamente para obter o deslocamento correto

    # Carregando o valor binário correspondente para t0
    la t4, numbers
    add t4, t4, t3  # Adiciona o deslocamento ao endereço base
    lw t0, 0(t4)

    # Calculando o deslocamento para o segundo algarismo
    slli t3, t1, 2  # Multiplica o segundo algarismo por 4 (cada entrada da tabela ocupa 4 bytes)
    add t3, t3, t3  # Multiplica por 2 novamente para obter o deslocamento correto

    # Carregando o valor binário correspondente para t1
    la t4, numbers
    add t4, t4, t3  # Adiciona o deslocamento ao endereço base
    lw t1, 0(t4)

    # Ajustando a ordem dos algarismos
    srl t0, t0, 1
    srl t1, t1, 1

    li a0, 0x120

    slli t0, t0, 8
    mv a1, t0
    li a2, -1
    ecall

    mv a1, t1
    li a2, 0b11111111
    ecall

    ret
