


.text
main:
    li a0, 0x101
    li a1, 0x00FFFFFF
    ecall
    
    li a0, 0x100
    li a1, 0x00000000
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000001
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000002
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000003
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000004
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000005
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000006
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000007
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000008
    li a2, 0x00FF0000
    ecall

    li a1, 0x00000009
    li a2, 0x00FF0000
    ecall

    li a1, 0x00020000
    li a2, 0x00000000
    ecall

    li a1, 0x00020001
    li a2, 0x00000000
    ecall

    li a1, 0x00020002
    li a2, 0x00000000
    ecall

    li a1, 0x00020003
    li a2, 0x00000000
    ecall

    li a1, 0x00020004
    li a2, 0x00000000
    ecall

    li a1, 0x00020005
    li a2, 0x00000000
    ecall

    li a1, 0x00020006
    li a2, 0x00000000
    ecall

    li a1, 0x00020007
    li a2, 0x00000000
    ecall

    li a1, 0x00020008
    li a2, 0x00000000
    ecall

    li a1, 0x00020009
    li a2, 0x00000000
    ecall


    addi a0, zero, 10
    ecall   # Encerra a execução do programa
