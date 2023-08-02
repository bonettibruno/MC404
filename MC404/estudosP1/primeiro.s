.text
dobro:
    add a0, a0, a0
    ret

main:  
    addi sp, sp, -4
    sw ra, sp, 0

    li a0, 10
    call dobro  # a0 = 20
    li a0, 5
    call dobro  # a0 = 10
    li a0, 1
    call dobro  # a0 = 2

    lw ra, sp, 0
    addi sp, sp, 4

    ret         
