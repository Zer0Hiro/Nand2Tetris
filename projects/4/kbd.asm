// cur = 0
// prev = 0
// while(TRUE){
//     cur = KBD
//     if(cur <= prev) goto CONT
//         counter = counter + 1
//     CONT:
//     prev = cur 
// }

@cur 
M = 0
@prev
M = 0
@counter
M = 0
(LOOP)
@KBD
D = M
@cur
M = D
@prev
D = M - D 
@CONT
D;JGE
@counter
M = M + 1
(CONT)
@cur
D = M
@prev
M = D
@LOOP
0;JMP