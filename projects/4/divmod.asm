// Start of program
@100
D = A
@R1
M = D
@3
D = A
@R2
M = D

@SCREEN
D = A
@SP
M = D
//Push values
@R4
D = A
@SP
M = M - 1
A = M
M = D

@R3
D = A
@SP
M = M - 1
A = M
M = D

@R2
D = M
@SP
M = M - 1
A = M
M = D

@R1
D = M
@SP
M = M - 1
A = M
M = D

@RET1
D = A
@SP
M = M - 1
A = M
M = D

@DIVMOD
0;JMP

(RET1)
@R5
M = D
(POP)
    @SP
    A = M
    D = M
    @SP
    M = M + 1
    @SCREEN
    D = A
    @SP
    D = D - M
    @ENDPC
    D;JEQ
    @POP
    0;JMP

(DIVMOD)
    //Get X
    @SP
    A = M + 1
    D = M
    @x
    M = D
    //Get y
    @2
    D = A
    @SP
    A = D + M
    D = M
    @y
    M = D

    //Reset resptr
    @3
    D = A
    @SP
    A = D + M
    A = M
    M = 0
    //Reset modptr
    @4
    D = A
    @SP
    A = D + M
    A = M
    M = 0

    (LOOP)
    @x
    D = M
    @END
    D;JLE
    @y
    D = M
    @x
    M = M - D
    D = M
    @NOMOD
    D;JGT
    // Has modulo
    @x
    D = M
    @y
    D = D + M
    @SP
    A = M + 1
    A = A + 1
    A = A + 1
    A = A + 1
    A = M
    M = D
    @LOOP
    0;JMP

    // No modulo
    (NOMOD)
    @3
    D = A
    @SP
    A = D + M
    A = M
    M = M + 1
    @LOOP
    0;JMP

    //Return 1/0 end of func
    (END)
    @y
    D = M
    @RETURN0
    D;JEQ
    D = 1 
    @SP
    A = M
    0;JMP
(RETURN0)   
    @SP
    A = M
    0;JMP

(ENDPC)
    @ENDPC
    0;JMP