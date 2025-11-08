load FullSub.hdl,
output-file FullSub.out,
compare-to FullSub.cmp,
output-list a%B3.1.3 b%B3.1.3 bIn%B3.1.3 diff%B3.1.3 bOut%B3.1.3;

set a 	%B0,
set b 	%B0,
set bIn %B0,
eval,
output;

set a 	%B0,
set b 	%B0,
set bIn %B1,
eval,
output;

set a 	%B0,
set b 	%B1,
set bIn %B0,
eval,
output;

set a 	%B0,
set b 	%B1,
set bIn %B1,
eval,
output;

set a 	%B1,
set b 	%B0,
set bIn %B0,
eval,
output;

set a 	%B1,
set b 	%B0,
set bIn %B1,
eval,
output;

set a 	%B1,
set b 	%B1,
set bIn %B0,
eval,
output;

set a 	%B1,
set b 	%B1,
set bIn %B1,
eval,
output;