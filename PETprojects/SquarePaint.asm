@16384
D = A
@SP
M = D + 1
@4111
D = A
@SCREEN
D = D + A
@position
M = D
@prev_pos

//KBD input ==============================
(KEY_INPUT)
    @KEY_PRESS_W8
    0;JMP
(KEY_RELEASE)
    @KBD
    D = M
    @KEY_RELEASE
    D;JNE // Still hold button

    @KEY_INPUT
    0;JMP

(KEY_PRESS_W8) // Wait for press
    @KBD
    D = M
    // Go right
    @pressed
    M = D
    @132 
    D = D - A
    @GO_RIGHT
    D;JEQ
    // Go left
    @pressed
    D = M
    @130 
    D = D - A
    @GO_LEFT
    D;JEQ
    // Go up
    @pressed
    D = M
    @131 
    D = D - A
    @GO_UP
    D;JEQ
    // Go down
    @pressed
    D = M
    @133 
    D = D - A
    @GO_DOWN
    D;JEQ
    //Keep Square
    @pressed
    D = M
    @32
    D = D - A
    @PLACE_BS
    D;JEQ
    @KEY_PRESS_W8
    0;JMP // not equal to arrows

// DIRECTIONS =============================

(GO_RIGHT) // ->
//push y
    @position
    D = M
    //Check first if its first line of screen
    @16896
    D = D - A
    @KEEP
    D;JLE
    //Don't keep pos
    @511
    D = A
    @position
    M = M - D
(KEEP)
    @position
    D = M
    @SP
    AM = M - 1
    M = D
    //push RET
    @RET
    D = A
    @SP
    AM = M - 1
    M = D
    @BLACK_SQUARE
    0;JMP

(GO_LEFT) // <-
//push y
    @position
    D = M
    //Check first if its first line of screen
    @16896
    D = D - A
    @KEEP
    D;JLE
    //Don't keep pos
    @513
    D = A
    @position
    M = M - D
(KEEP)
    @position
    D = M
    @SP
    AM = M - 1
    M = D
    //push RET
    @RET
    D = A
    @SP
    AM = M - 1
    M = D
    @BLACK_SQUARE
    0;JMP

(GO_UP) // ^
//push y
    @position
    D = M
    //Check first if its first line of screen
    @16896
    D = D - A
    @KEEP
    D;JLE
    //Don't keep pos
    @1056
    D = A
    @position
    M = M - D
(KEEP)
    @position
    D = M
    @SP
    AM = M - 1
    M = D
    //push RET
    @RET
    D = A
    @SP
    AM = M - 1
    M = D
    @BLACK_SQUARE
    0;JMP

(GO_DOWN) // !^
//push y
    @position
    D = M
    //Check first if its first line of screen
    @16896
    D = D - A
    @KEEP
    D;JLE
    //Don't keep pos
    @32
    D = A
    @position
    M = M + D
(KEEP)
    @position
    D = M
    @SP
    AM = M - 1
    M = D
    //push RET
    @RET
    D = A
    @SP
    AM = M - 1
    M = D
    @BLACK_SQUARE
    0;JMP

(PLACE_BS)
    @32
    D = A
    @keep_button
    M = D
    @KEY_RELEASE
    0;JMP

// RETURN =============================

(RET)
    @temp
    M = D
    // If space activated
    @keep_button
    D = M
    @32
    D = D - A
    @NO_CLEAR
    D;JEQ
    @counter
    M = 0
(CLEAR_OLD_SQUARE)
    @16
    D = A
    @counter
    D = M - D
    @NO_CLEAR
    D;JEQ

    D = 0
    @prev_pos
    A = M
    M = D
    @32
    D = A
    @prev_pos
    M = M + D
    @counter
    M = M + 1
    @CLEAR_OLD_SQUARE
    0;JMP
(NO_CLEAR)
    @keep_button
    M = 0
    @position
    D = M
    @prev_pos
    M = D
    @temp
    D = M
    @position
    M = D
    @2
    D = A
    @SP
    M = M + D
    @KEY_RELEASE
    0;JMP

//FUNCTIONS ============================

// Print Black Square
(BLACK_SQUARE)
    // get y coordinate
    @SP
    A = M + 1
    D = M
    @y
    M = D
    // start counter (fine until 16)
    @counter
    M = 0
(LOOP)
    @16
    D = A
    @counter
    D = M - D
    @END_PROC
    D;JEQ

    @32767
    D = A
    @y
    A = M
    M = D
    @32
    D = A
    @y
    M = M + D
    @counter
    M = M + 1
    @LOOP
    0;JMP

(END_PROC)
    @y
    D = M
    @SP
    A = M
    A = M
    0;JMP