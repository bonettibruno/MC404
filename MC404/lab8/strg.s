.data
buffer: .space 256

.text
main:
    # Setup stack frame
    addi sp, sp, -16
    sw ra, 8(sp)
    sw s0, 4(sp)
    add s0, x0, sp

    # Call gets function to read input string
    add s0, x0, sp
    jal ra, gets
    add s0, x0, a0

    # Print input string
    la a0, buffer
    addi a1, x0, 0
    li a7, 4
    ecall

    # Exit program
    lw ra, 8(sp)
    lw s0, 4(sp)
    addi sp, sp, 16
    li a0, 0
    ret


gets:
    # Setup stack frame
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)

    # Load buffer address into s0
    add s0, x0, a0

    # Read characters from keyboard
    addi a0, x0, 0x130
    ecall