@SCREEN
D = A
@SP
M = D

//R1 = 7; // Adress of Array
@7
D = A
@R1
M = D

//R2 = 6; // Size of Array
@6
D = A
@R2
M = D
// R3 = 3; //K position
@3
D = A
@R3
M = D
//Start Push to SP
// push(R3);
// push(R2);
// push(R1);
// push(&RET1);
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


//goto FINDK;
@FINDK
0;JMP

// RET1:
// int R4 = D;
// SP+=4;
// goto END;
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

//FINDK:
(FINDK)
    //Start Values
    // int flag = 1;
    // int i = 0;
    @flag
    M = 1
    @i
    M = 0

    //Get K
    // int k = *R3 //K
    @3
    D = A
    @SP
    A = M + D
    D = M
    @k
    M = D

    //Get Size
    // int size = *R2 //Size
    @2
    D = A
    @SP
    A = M + D
    D = M
    @size
    M = D
    
    //Get Position
    // int pos = *(SP + 1); //current position
    @SP
    A = M + 1
    D = M
    @pos
    M = D
    // LOOP:
    (LOOPFIND)
        //if(i >= size) goto RET1;
        @size
        D = M
        @i
        D = M - D
        @ENDFK
        D;JGE

        //Push to SP for FINDABOVE
        // push(size);
        @size
        D = M
        @SP
        AM = M - 1
        M = D
        //Push start of array
        // push(pos);
        @pos
        D = M
        @SP
        AM = M - 1
        M = D
        //Push pos of num in array
        // push(pos+i);
        @i
        D = M
        @pos
        D = M + D
        @SP
        AM = M - 1
        M = D
        //Push Return point
        // push(RETK);
        @RETK
        D = A
        @SP
        AM = M - 1
        M = D

        //JUMP to FINDABOVE
        // goto FINDABOVE;
        @FINDABOVE
        0;JMP
    (RETK)
        // flag = D;
        // SP+=4;
        @flag
        M = D
        @4
        D = A
        @SP
        M = M + D

        //Check if number that we need
        // i++
        // if(size - flag != k) goto LOOP
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
        // D = *(pos + i - 1)
        @i
        D = M
        @pos
        D = D + M
        D = D - 1 //Substract last i++
        A = D
        D = M
        // goto *SP
        @SP
        A = M
        A = M
        0;JMP

//FINDABOVE FUNC
(FINDABOVE)
    // int j = 0;
    @j
    M = 0
    // int counter = 0;
    @counter
    M = 0
    //size of array
    // int fsize = *(SP+3);
    @3
    D = A
    @SP
    A = M + D
    D = M
    @fsize
    M = D
    //get adress of array
    // int* farr = *(SP+2);
    @2
    D = A
    @SP
    A = M + D
    D = M
    @farr
    M = D
    //get number that we check
    // int n = **(SP + 1);
    @SP
    A = M + 1
    A = M
    D = M
    @n
    M = D
    // LOOPABOVE:
    (LOOPABOVE)
        //check if not overflow
        // if(j >= fsize) goto ENDFIND;
        @fsize
        D = M
        @j
        D = M - D
        @ENDFIND
        D;JGE

        //check if number > arr[j]
        // if(n <= farr[j]) goto ADDJ;
        @farr
        D = M
        @j
        A = D + M
        D = M
        @n
        D = M - D
        @ADDJ
        D;JLE
        // counter++;
        @counter
        M = M + 1
        // ADDJ:
        (ADDJ)
            // j++;
            @j
            M = M + 1
            // goto LOOPABOVE;
            @LOOPABOVE
            0;JMP
    // ENDFIND:
    (ENDFIND)
        // D = counter; 
        @counter
        D = M
        // goto *SP;
        @SP
        A = M
        A = M
        0;JMP


//END:
(END)
    // goto END;
    @END
    0;JMP