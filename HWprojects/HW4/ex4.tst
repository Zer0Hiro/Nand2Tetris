load ex4.vm,
output-file ex4.out,
compare-to ex4.cmp,

// Outputs the value of static 0, static 1
output-list RAM[16]%D1.6.1 RAM[17]%D1.6.1;

//test n=1, 1^2
load ex4.vm,
set RAM[16] 1,   // static 0 <- 1
set RAM[17] -1,  // static 1 <- -1
repeat 2000 {    // running 
  vmstep;
}
output;

//test n=2, 1^2 + 2^2
load ex4.vm,
set RAM[16] 2,   // static 0 <- 2
set RAM[17] -1,  // static 1 <- -1
repeat 2000 {    // running 
  vmstep;
}
output;

//test n=3, 1^2 + 2^2 + 3^2
load ex4.vm,
set RAM[16] 3,   // static 0 <- 3
set RAM[17] -1,  // static 1 <- -1
repeat 2000 {    // running 
  vmstep;
}
output;

//test n=7, 1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 7^2
load ex4.vm,
set RAM[16] 7,   // static 0 <- 7
set RAM[17] -1,  // static 1 <- -1
repeat 2000 {    // running 
  vmstep;
}
output;

//test n=10, 1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 7^2 + 8^2 + 9^2 + 10^2
load ex4.vm,
set RAM[16] 10,  // static 0 <- 10
set RAM[17] -1,  // static 1 <- -1
repeat 2000 {    // running 
  vmstep;
}
output;



