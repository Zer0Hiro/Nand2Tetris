// if ( R1 > R2 ) => R0 = R1
// else R0 = R2 
@R1
D = M
@R2 
D = M - D // R2 - R1
@ELSE
D;JGT // R2 - R1 < 0
@R1
D = M
@R0
M = D
@END
0;JMP
(ELSE)
@R2
D = M
@R0
M = D
(END)
@END
0;JMP