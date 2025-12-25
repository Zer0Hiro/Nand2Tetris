#Init file
def init(file):
    return open(file, "r")

#Parse each line of file
def parseNextLine(filename):
    line = filename.readline()
    
    if not line:
        return None
    return line

#Get instruction type
def instructionType(line):
    line = line.strip()
    if len(line) == 0 or line[0] == "/":
        return "COMMENT_OR_EMPTY"
    elif line[0] == "@" and line[1].isdigit() == False:
        return "A_INSTRUCTION"
    elif line[0] == ("("):
        return "L_INSTRUCTION"
    elif line[0] in ("D","M","A"):
        return "C_INSTRUCTION"

    
#Symbol Parser
def symbol(instruction,line):
    line = line.strip()
    if instruction == "A_INSTRUCTION":
        return line.replace("@","")
    elif instruction == "L_INSTRUCTION":
        return line.strip().strip("()")

#Dest Parser
def dest(str):
    str = str.split("//")[0].strip()
    str = str.replace(" ","")
    if "=" not in str:
        return ""
    return str.split("=")[0]

#Comp parser
def comp(str):
    str = str.split("//")[0].strip()
    str = str.replace(" ","")
    if "=" not in str:
        return str.split(";")[0]
    return str.split("=")[1].split(";")[0]

#Jump parser
def jump(str):
    str = str.split("//")[0].strip()
    if "=" not in str:
        return str.split(";")[1]
    elif ";" not in str:
        return ""
    return str.split("=")[1].split(";")[1]
        