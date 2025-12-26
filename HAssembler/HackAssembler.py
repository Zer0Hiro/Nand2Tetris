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
    print(f"{nextline} : {instruction}")
    #Move pc
    if instruction != "COMMENT_OR_EMPTY":
        pc += 1
    #Label parse
    if instruction == "L_INSTRUCTION":
        symbol = parser.symbol(instruction,nextline)
        if symbol in SymbolTable.SYMBOLS:
            pc -= 1
            continue
        else:
            SymbolTable.addEntry(symbol,pc)
            pc -= 1
        print(f"{symbol} = {SymbolTable.SYMBOLS[symbol]}")
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
        print(symbol)
        #Check which symbol is that
        if symbol not in SymbolTable.SYMBOLS and symbol[0].isdigit() == False:
            SymbolTable.addEntry(symbol,symbol_reg)
            symbol_bin = format(symbol_reg,"016b")
            symbol_reg += 1
        elif symbol in SymbolTable.SYMBOLS:
            symbol_bin = format(SymbolTable.SYMBOLS[symbol],"016b")
        else:
            symbol_bin = format(int(symbol),"016b")
        print(symbol_bin)
        #output symbol
        output.write(f"{symbol_bin}\n")
        
    if instruction == "C_INSTRUCTION":
        destination = parser.dest(nextline)
        print(destination, end=" ") #DEBUGGER
        compute = parser.comp(nextline)
        print(compute, end=" ") #DEBUGGER
        jumping = parser.jump(nextline)
        print(jumping) #DEBUGGER
        
        dest_bin = code.destin(destination)
        compute_bin = code.comp(compute)
        jump_bin = code.jmp(jumping)
        #Translate to 16 bit
        result_bin = f"111{compute_bin}{dest_bin}{jump_bin}"
        print(result_bin)
        output.write(f"{result_bin}\n")