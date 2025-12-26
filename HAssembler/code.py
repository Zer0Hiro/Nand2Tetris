destdict = { 
    "": "000",
    "M": "001", 
    "D": "010",
    "DM": "011",
    "A": "100",
    "AM": "101",
    "AD": "110",
    "ADM": "111",
}

jmpdict = {
    "": "000",
    "JGT": "001",
    "JEQ": "010",
    "JGE": "011",
    "JLT": "100",
    "JNE": "101",
    "JLE": "110",
    "JMP": "111",
}

compdict = {
    "0": "0101010",
    "1": "0111111",
    "-1": "0111010",
    "D": "0001100",
    "A": "0110000",
    "M": "1110000",
    "!D": "0001101",
    "!A": "0110001",
    "!M": "1110001",
    "-D": "0001111",
    "-A": "0110011",
    "-M": "1110011",
    "D+1": "0011111",
    "A+1": "0110111",
    "M+1": "1110111",
    "D-1": "0001110",
    "A-1": "0110010",
    "M-1": "1110010",
    "D+A": "0000010",
    "M+D": "1000010",
    "D-A": "0010011",
    "D-M": "1010011",
    "A-D": "0000111",
    "M-D": "1000111",
    "D&A": "0000000",
    "D&M": "1000000",
    "D|A": "0010101",
    "D|M": "1010101",
}

#Binary rep of dest field
def destin(dest):
    sort_dest = "".join(sorted(dest))
    if dest in destdict:
        return destdict.get(sort_dest, "000")

#Binary rep of comp field
def comp(comp):
    #Fix order problem
    if comp in ("+","|","&"):
        sort_comp = sorted(comp.split(comp[1]))
        operator = comp[1]
        comp = operator.join(sort_comp)
    if comp in compdict:
        return compdict.get(comp, "0000000")

#Binary rep of jump field
def jmp(jump):
    for list in jmpdict:
        if list == jump:
            return jmpdict[list]