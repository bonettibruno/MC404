#232488 - Bruno Monteiro Bonetti

#formato das instrucoes: sempre usar um espaço entre cada argumento das instrucoes, exemplo: "addi s0, s1, 20"

def decimal_para_comp2(numero_decimal, num_bits):
    if numero_decimal >= 0:
        return bin(numero_decimal)[2:].zfill(num_bits)
    else:
        numero_absoluto = abs(numero_decimal)
        binario = bin(numero_absoluto)[2:].zfill(num_bits)
        invertido = ''.join('1' if bit == '0' else '0' for bit in binario)
        complemento2 = bin(int(invertido, 2) + 1)[2:].zfill(num_bits)
        return complemento2

#dicionarios que serao usados
opcode = {
    'addi': '0010011',
    'slli': '0010011',
    'xor': '0110011',
    'call': '1101111',
    'ret': '1100111',
    'beq': '1100011',
    'lw': '0000011',
    'sw': '0100011',
    'mul': '0110011',
    'lui': '0110111'
}

registers = {
    'zero': '00000',
    'ra': '00001',
    'sp': '00010',
    'gp': '00011',
    'tp': '00100',
    't0': '00101',
    't1': '00110',
    't2': '00111',
    's0': '01000',
    's1': '01001',
    'a0': '01010',
    'a1': '01011',
    'a2': '01100',
    'a3': '01101',
    'a4': '01110',
    'a5': '01111',
    'a6': '10000',
    'a7': '10001',
    's2': '10010',
    's3': '10011',
    's4': '10100',
    's5': '10101',
    's6': '10110',
    's7': '10111',
    's8': '11000',
    's9': '11001',
    's10': '11010',
    's11': '11011',
    't3': '11100',
    't4': '11101',
    't5': '11110',
    't6': '11111'
}

entrada = input("Digite a instrução: ")
vet_entrada = entrada.split(" ")
instrucao = vet_entrada[0]

#checando se a instrução que pediu esta na lista das que estao configuradas
while((vet_entrada[0] in opcode.keys()) == False):
    entrada = input("Não temos essa instrução. Digite uma instrução válida: ")
    vet_entrada = entrada.split(" ")
    instrucao = vet_entrada[0]

#checa se tem mais de um elemento no vetor (porque pode ser ret):
if ((len(vet_entrada) > 1) & (len(vet_entrada) != 2)):
    prim_arg = vet_entrada[1][:-1]
    rd = registers[prim_arg]

#se for True, eh call
if (len(vet_entrada) == 2):
    prim_arg = vet_entrada[1]

#checa se tem mais de dois elementos no vetor
if (len(vet_entrada) > 2):
    seg_arg = vet_entrada[2]
    if not seg_arg[-1].isdigit():
        seg_arg = seg_arg[:-1]

    if len(vet_entrada) > 3:
        terc_arg = vet_entrada[3]

instr_binaria = opcode[instrucao]

if instrucao in ['addi', 'slli']:
    rs1 = registers[seg_arg]

    if instrucao == 'addi':
        imm = decimal_para_comp2(int(terc_arg), 12)
        binario = imm + rs1 + '000' + rd + instr_binaria
    elif instrucao == 'slli':
        shamt = decimal_para_comp2(int(terc_arg), 5)
        binario = '0000000' + shamt + rs1 + '001' + rd + instr_binaria

elif instrucao == 'xor':
    rs1 = registers[seg_arg]
    rs2 = registers[terc_arg]
    binario = '0000000' + rs2 + rs1 + '100' + rd + instr_binaria

elif instrucao == 'mul':
    rs1 = registers[seg_arg]
    rs2 = registers[terc_arg]
    binario = '0000001' + rs2 + rs1 + '000' + rd + instr_binaria

elif instrucao == 'lui':
    imm = decimal_para_comp2(int(seg_arg), 20)
    binario = imm + rd + instr_binaria

elif instrucao == 'lw':
    offset = seg_arg.split("(")[0]
    registrador = seg_arg.split("(")[1].rstrip(")")
    rs1 = registers[registrador]
    imm = decimal_para_comp2(int(offset), 12)
    binario = imm + rs1 + '010' + rd + instr_binaria

elif instrucao == 'sw':
    offset = seg_arg.split("(")[0]
    registrador = seg_arg.split("(")[1].rstrip(")")
    rs1 = registers[registrador]
    imm = decimal_para_comp2(int(offset), 12)
    binario = imm[0:7] + rd + rs1 + '010' + imm[7:12] + instr_binaria

#usar numero ao inves da label
elif instrucao == 'beq':
    rs1 = registers[prim_arg]
    rs2 = registers[seg_arg]
    pulo = int(terc_arg) - 1000
    imm = decimal_para_comp2(int(pulo), 13)
    binario = imm[0:1] + imm[2:8] + rs2 + rs1 + '000' + imm[8:12] + imm[1:2] + instr_binaria

#call = jal ra, label (que aqui estamos usando numeros)
elif instrucao == 'call':
    rd = registers['ra']
    pulo = int(prim_arg) - 1000
    imm = decimal_para_comp2(int(pulo), 21)
    binario = imm[0:1] + imm[10:20] + imm[9:10] + imm[1:9] + rd + instr_binaria

#jalr zero, ra, 0
elif instrucao == 'ret':
    rd = registers['zero']
    binario = '000000000000' + '00000' + '00001' + '000' + rd + instr_binaria

hexadecimal = hex(int(binario, 2))

while (len(hexadecimal) < 10):
    hexadecimal = hexadecimal[:2] + "0" + hexadecimal[2:]

hexadecimal = hexadecimal.upper()
hexadecimal = hexadecimal.replace('X', 'x')
print(hexadecimal)
