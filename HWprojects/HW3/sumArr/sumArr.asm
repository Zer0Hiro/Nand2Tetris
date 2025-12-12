// //Adjusted Code
// R1 = 5; //Size of array
// R2 = 4; //Adress of index 0 in array
// int i = -1;
// //Enter array values (OPTIONAL)
// LOOP:
//     if(R2 - i == 0) goto END;
//     i++;
//     if(array(i)&&1 != 0) goto LOOP;
//     R0+=array(i);
//     goto LOOP;
// END:
//     goto END;

@5
D = A
@R1
M = D
@4
D = A
@R2
M = D
//Position of PC in array
@i
M = -1

(LOOP)
    //If at the end of the loop
    @i
    D = M
    @R1
    D = M - D
    @END
    D;JEQ
    
    @i
    M = M + 1
    //If even
    @i
    D = M
    @R2
    A = D + M

    D = 1
    D = D&M
    @LOOP // NOT EVEN
    D;JGT

    //EVEN
    @i
    D = M
    @R2
    A = D + M
    D = M
    @R0
    M = D + M
    @LOOP
    0;JMP

(END)
    @END
    0;JMP