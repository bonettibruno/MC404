def assembly_to_hex(instruction):
    opcode = {
        'addi': '0010011',
        'slli': '0010011',
        'xor': '0010011',
        'call': '1101111',
        'ret': '1101111',
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

    tokens = instruction.split(' ')
    mnemonic = tokens[0]
    rd = tokens[1][:-1]
    rs1 = tokens[2][:-1]

    if mnemonic in ['addi', 'slli', 'xor', 'lw', 'sw']:
        imm = '{0:012b}'.format(int(tokens[3]))
        funct3 = '000'
        funct7 = '0000000'
        binary_code = opcode[mnemonic] + funct3 + registers[rs1] + registers[rd] + imm
    elif mnemonic == 'call':
        imm = '{0:020b}'.format(int(tokens[1]))
        binary_code = opcode[mnemonic] + imm[10:20] + registers[rd] + '000' + imm[0:10] + '1'
    elif mnemonic == 'ret':
        binary_code = opcode[mnemonic] + '000000000000' + registers[rd] + '000' + '000000000001'
    elif mnemonic == 'beq':
        imm = '{0:012b}'.format(int(tokens[3]))
        funct3 = '000'
        imm_11 = imm[0]
        imm_4_1 = imm[1:5]
        imm_10_5 = imm[5:12]
        binary_code = opcode[mnemonic] + imm_11 + imm_4_1 + registers[rs1] + registers[rd] + funct3 + imm_10_5 + imm_11 + imm_4_1 + '0'
    elif mnemonic == 'mul':
        funct3 = '000'
        funct7 = '0000001'
        binary_code = opcode[mnemonic] + funct3 + registers[rs1] + registers[rd] + funct7 + funct3
    elif mnemonic == 'lui':
        imm = '{0:020b}'.format(int(tokens[2]))
        binary_code = opcode[mnemonic] + imm + registers[rd]
    elif mnemonic == 'li':
        immediate = int(tokens[2])
        if immediate >= -2048 and immediate <= 2047:
            imm = '{0:012b}'.format(immediate)
            binary_code = opcode['addi'] + '000' + registers['zero'] + registers[rd] + imm
        else:
            imm_high = '{0:020b}'.format(immediate >> 12)
            imm_low = '{0:012b}'.format(immediate & 0xFFF)
            binary_code = opcode['lui'] + imm_high + registers[rd] + opcode['addi'] + '000' + registers[rd] + imm_low

    hex_code = hex(int(binary_code, 2))

    return hex_code


# Exemplo de uso:
instruction = input("Digite a instrução em assembly: ")
hexadecimal = assembly_to_hex(instruction)
print('Código hexadecimal correspondente:', hexadecimal)
