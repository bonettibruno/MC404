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
    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

	mv s1, zero
	li a1, 2

	mv s2, zero
	li a2, 3

for1:
	for2:

		add a0, s1, s2
		sw a0, s0, 0
		addi s0, s0, 4
		addi s2, s2, 1
		bne s2, a2, for2

	mv s2, zero
	addi s1, s1, 1
	bne s1, a1, for1

ret