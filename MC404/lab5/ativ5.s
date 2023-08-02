.data
string:
	.word 0

.text
main:
	lui a0, %hi(string)
    addi a0, a0, %lo(string)
    li a1, 4
    li t0, 6 #leitura de String
    ecall
    li s1, -1
    li s3, 32 

    while:
    	lb a2, a0, 0
    	addi a0, a0, 1
    	addi s1, s1, 1
    	bge s1, a1, fim
    	bne a2, s3, while

    fim:
     mv a0, s1
     li t0, 1
     ecall

     ret


