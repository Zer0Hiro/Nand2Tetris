// Adjusted Code
//     R1 = 100; // Adress of Array
//     R2 = 9; // Size of Array
//     R3 = 3; //K position

//     push(R3);
//     push(R2);
//     push(R1);
//     push(&RET1);
//     goto FINDK;
// RET1:
//     int R4 = D;
//     SP+=4;
//     goto END;

// FINDK:
//     int flag = 1;
//     int i = 0;
//     int k = *R3 //K
//     int size = *R2 //Size
//     int pos = *(SP + 1); //current position
//     LOOP:
//         if(i >= size) goto RET1;
//         push(size);
//         push(pos);
//         pos  = pos + i;
//         push(pos);
//         push(RETK);
//         goto FINDABOVE;
//     RETK:
//         flag = D;
//         SP+=4;
//         i++
//         if(size - flag != k) goto LOOP
//         D = *(pos + i - 1)
//         goto *SP
// 
// FINDABOVE:
//     int j = 0;
//     int counter = 0;
//     int fsize = *(SP+3);
//     int* farr = *(SP+2);
//     int n = **(SP + 1);
//     LOOPABOVE:
//         if(j >= fsize) goto ENDFIND;
//         if(n <= farr[j]) goto ADDJ;
//         counter++;
//         ADDJ:
//             j++;
//             goto LOOPABOVE;   
//     ENDFIND:
//         D = counter;
//         goto *SP;
// END:
//     goto END;


//Setup Array
@100
D = A
@R1
M = D

@SCREEN
D = A
@SP
M = D
//R2 is the size of array
//R3 is K position

//Start Push to SP
//Push K pos
@R3
D = M
@SP
AM = M - 1
M = D

//Push Size
@R2
D = M
@SP
AM = M - 1
M = D

//Push Adress
@R1
D = M
@SP
AM = M - 1
M = D

//Push Return
@RET1
D = A
@SP
AM = M - 1
M = D

//Goto FINDK
@FINDK
0;JMP

(RET1) // End of FINDK
    @R4
    M = D
    //Pop SP
    @4
    D = A
    @SP
    M = M + D
    @END
    0;JMP

//FINDK FUNC
(FINDK)
    //Start Values
    @flag
    M = 1
    @i
    M = 0
    
    //Get K
    @3
    D = A
    @SP
    A = M + D
    D = M
    @k
    M = D

    //Get Size
    @2
    D = A
    @SP
    A = M + D
    D = M
    @size
    M = D
    
    //Get Position
    @SP
    A = M + 1
    D = M
    @pos
    M = D
    (LOOPFIND)
        @size
        D = M
        @i
        D = M - D
        @ENDFK
        D;JGE

        //Push to SP for FINDABOVE
        @size
        D = M
        @SP
        AM = M - 1
        M = D
        //Push start of array
        @pos
        D = M
        @SP
        AM = M - 1
        M = D
        //Push pos of num in array
        @i
        D = M
        @pos
        D = M + D
        @SP
        AM = M - 1
        M = D
        //Push Return point
        @RETK
        D = A
        @SP
        AM = M - 1
        M = D

        //JUMP to FINDABOVE
        @FINDABOVE
        0;JMP
    (RETK)
        @flag
        M = D
        @4
        D = A
        @SP
        M = M + D

        //Check if number that we need
        @i
        M = M + 1
        @flag
        D = M
        @size
        D = M - D
        @k
        D = D - M
        @LOOPFIND
        D;JNE
    (ENDFK)
        //If our number
        @i
        D = M
        @pos
        D = D + M
        D = D - 1 //Substract last i++
        A = D
        D = M
        @SP
        A = M
        A = M
        0;JMP

//FINDABOVE FUNC
(FINDABOVE)
    @j
    M = 0
    @counter
    M = 0
    //size of array
    @3
    D = A
    @SP
    A = M + D
    D = M
    @fsize
    M = D
    //get adress of array
    @2
    D = A
    @SP
    A = M + D
    D = M
    @farr
    M = D
    //get number that we check
    @SP
    A = M + 1
    A = M
    D = M
    @n
    M = D
    (LOOPABOVE)
        //check if not overflow
        @fsize
        D = M
        @j
        D = M - D
        @ENDFIND
        D;JGE

        //check if number > arr[j]
        @farr
        D = M
        @j
        A = D + M
        D = M
        @n
        D = M - D
        @ADDJ
        D;JLE
        @counter
        M = M + 1
        (ADDJ)
            @j
            M = M + 1
            @LOOPABOVE
            0;JMP
    (ENDFIND)
        @counter
        D = M
        @SP
        A = M
        A = M
        0;JMP


//END OF PROGRAM
(END)
    @END
    0;JMP