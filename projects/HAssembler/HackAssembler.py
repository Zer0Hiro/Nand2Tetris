import code
import parser
import SymbolTable

#init file and start reading lines
file = parser.init("file.asm")
pc = -1

#First Pass        
while True:
    #Check line instruction
    nextline = parser.parseNextLine(file)
    if nextline == None:
        break
    instruction = parser.instructionType(nextline)
    #Move pc
    if instruction != "COMMENT_OR_EMPTY":
        pc += 1
    #Label parse
    if instruction == "L_INSTRUCTION":
        symbol = parser.symbol(instruction,nextline)
        if symbol in SymbolTable.SYMBOLS:
            continue
        else:
            SymbolTable.addEntry(symbol,pc)
            pc -= 1

#SymbolTable.sym_print() Check if labels are in table

#Second Pass
pc = -1
file.seek(0)
symbol_reg = 16
output = open("file.hack", "w")
while True:
    #Check line instruction
    nextline = parser.parseNextLine(file)
    if nextline == None:
        break
    instruction = parser.instructionType(nextline)
    #Garbo
    if instruction in ("COMMENT_OR_EMPTY","L_INSTRUCTION"):
        continue
    #Move pc
    pc += 1
    
    if instruction == "A_INSTRUCTION":
        symbol = parser.symbol(instruction,nextline)
        if symbol not in SymbolTable.SYMBOLS:
            SymbolTable.addEntry(symbol,symbol_reg)
            symbol_reg += 1
        symbol_bin = format(symbol_reg-1,"016b")
        print(symbol_bin) #REMOVE
        #output symbol
        output.write(f"{symbol_bin}\n")
    if instruction == "C_INSTRUCTION":
        destination = parser.dest(nextline)
        print(destination) #REMOVE
        compute = parser.comp(nextline)
        print(compute) #REMOVE
        jumping = parser.jump(nextline)
        print(jumping) #REMOVE
        
        dest_bin = code.destin(destination)
        compute_bin = code.comp(compute)
        jump_bin = code.jmp(jumping)
        #Translate to 16 bit
        result_bin = f"111{compute_bin}{dest_bin}{jump_bin}"
        print(result_bin)
        output.write(f"{result_bin}\n")