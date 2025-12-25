SYMBOLS = {
    "RO": 0,
    "R1": 1,
    "R2": 2,
    "R3": 3,
    "R4": 4,
    "R5": 5,
    "R6": 6,
    "R7": 7,
    "R8": 8,
    "R9": 9,
    "R10": 10,
    "R11": 11,
    "R12": 12,
    "R13": 13,
    "R14": 14,
    "R15": 15,
    "SCREEN": 16384,
    "KBD": 2,
    "SP": 0,
    "LCL": 1,
    "ARG": 2,
    "THIS": 3,
    "THAT": 4,
}
symbol_pos = 16

destdict = { {"", "000"}, {"M", "001"}, {"D", "010"}, {"MD", "011"}, {"A", "100"}, {"AM", "101"}, {"AD", "110"}, {"ADM", "111"} }
compdict = { {"0", "0101010"}, {"1", "0111111"}, {"-1", "0111010"}, {"D", "0001100"}, {"A", "0110000"}, {"M", "1110000"}, {"!D", "0001101"}, {"!A", "0110001"}, {"!M", "1110001"}, {"-D", "0001111"}, {"-A", "0110011"}, {"-M", "1110011"}, {"D+1", "0011111"}, {"A+1", "0110111"}, {"M+1", "1110111"}, {"D-1", "0001110"}, {"A-1", "0110010"}, {"M-1", "1110010"}, {"D+A", "0000010"}, {"D+M", "1000010"}, {"D-A", "0010011"}, {"D-M", "1010011"}, {"A-D", "0000111"}, {"M-D", "1000111"}, {"D&A", "0000000"}, {"D&M", "1000000"}, {"D|A", "0010101"}, {"D|M", "1010101"}, {"M+D", "1000010"}, {"M+A", "0000010"} };
jmpdict = { {"", "000"}, {"JGT", "001"}, {"JEQ", "010"}, {"JGE", "011"}, {"JLT", "100"}, {"JNE", "101"}, {"JLE", "110"}, {"JMP", "111"} };




def parser_parseNextLine(filename):
    with open(filename, 'r') as file:    
        for line in file:
            print(line)

#Get instruction type
def parser_instructionType(line):
    if line[0] == "/" or "":
        parser_symbol()
        return
    elif line[0] == "@":
        return line.strip("@")
    elif line[0] == "(":
        return line.strip("()")
    elif line[0] == "D" or "M":
        return C_INSTRUCTION

#Symbol Parser
def parser_symbol(symbol):
    if symbol not in SYMBOLS:
        SYMBOLS[symbol] = symbol_pos
        symbol_pos += 1
        print(SYMBOLS) 

#Dest Parser
def parser_dest(str):
    #FIX FOR 0;JMP
    return str.split("=")[0]

#Comp parser
def parser_comp(str):
    return str.split("=")[1].split(";")[0]

#Jump parser
def parser_jump(str):
    return str.split("=")[1].split(";")[1]
        


def main():
    file = "file.asm"
    parser_parseNextLine(file)
