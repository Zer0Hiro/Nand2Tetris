load AdderSub8.hdl,
output-file AdderSub8.out,
compare-to AdderSub8.cmp,
output-list a%B1.8.1 b%B1.8.1 control%B5.1.5 res%B1.8.1 cOut%B3.1.2 ifZero%B5.1.4;


set a %B00000000,
set b %B00110100,
set control 0,
eval,
output;

set a %B00000000,
set b %B00110100,
set control 1,
eval,
output;

set a %B01110110,
set b %B00000000,
set control 0,
eval,
output;

set a %B01110110,
set b %B00000000,
set control 1,
eval,
output;

set a %B10101010,
set b %B01010101,
set control 0,
eval,
output;

set a %B10101010,
set b %B01010101,
set control 1,
eval,
output;

set a %B10101010,
set b %B10101010,
set control 0,
eval,
output;

set a %B10101010,
set b %B10101010,
set control 1,
eval,
output;