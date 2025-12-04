@20
D = A
@R1
M = D
@5
D = A
@R2
M = D
@position
M = -1

(SUM)
    //End of Array check
    @position
    M = M + 1
    D = M
    @R2
    D = D - M
    @END
    D;JEQ

    //Even?
    @position
    D = M
    @R1
    A = D + M
    D = 1
    D = M&D
    @SUM
    D;JGT //Not even

    @position
    D = M
    @R1
    A = D + M
    D = M

    @R0 //Get answer
    M = D + M
    @SUM
    0;JMP
(END)
    @END
    0;JMP


