import binascii

def z01_valid_assembly(line):
    line = line.strip()
    instrs = ["mov", "lea", "sub", "add", "jmp", "je", "jg", "jl", "jne", "jle", "jge", "nop", "rsub", "inc", "dec", "not", "neg", "and", "or"]
    find = line.find(" ")
    if find == -1:
        find = len(line)

    find = min(find, 3)
    instr  = line[0:find]
    return instr in instrs or ":" in line and (not line.startswith(";"))

def bin_str_to_hex(data):
    if data.strip() == "":
        return ""
    return hex(int(data,2))

def hex_str_to_bin(data):
    if data.strip() == "":
        return ""
    x = bin(int(str(data), 16))[2:]
    return "0"*(16-len(x)%17) + x

def z01_real_line(ll, pc_counter):
    a = len([i for i in ll if i <= pc_counter])
    return pc_counter + a
