load HalfSub.hdl,
output-file HalfSub.out,
compare-to HalfSub.cmp,
output-list a%B3.1.3 b%B3.1.3 diff%B3.1.3 bOut%B3.1.3;

set a %B0,
set b %B0,
eval,
output;

set a %B0,
set b %B1,
eval,
output;

set a %B1,
set b %B0,
eval,
output;

set a %B1,
set b %B1,
eval,
output;